package com.example.aquarium_journal

import android.content.Intent
import android.net.Uri
import android.provider.OpenableColumns
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val channelName = "app/json_file"

    private var pendingUri: String? = null
    private var pendingName: String? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "getPendingFile" -> {
                    val uri = pendingUri

                    if (uri == null) {
                        result.success(null)
                    } else {
                        val name = pendingName

                        // Забираем один раз.
                        pendingUri = null
                        pendingName = null

                        result.success(
                            mapOf<String, Any?>(
                                "uri" to uri,
                                "name" to name
                            )
                        )
                    }
                }

                "readTextFromUri" -> {
                    val uriString = call.argument<String>("uri")

                    if (uriString.isNullOrBlank()) {
                        result.error(
                            "NO_URI",
                            "URI не передан",
                            null
                        )
                        return@setMethodCallHandler
                    }

                    try {
                        val uri = Uri.parse(uriString)

                        val inputStream = contentResolver.openInputStream(uri)

                        if (inputStream == null) {
                            result.error(
                                "NO_INPUT_STREAM",
                                "Не удалось открыть поток файла",
                                null
                            )
                            return@setMethodCallHandler
                        }

                        val text = inputStream
                            .bufferedReader(Charsets.UTF_8)
                            .use { it.readText() }

                        result.success(text)
                    } catch (e: Exception) {
                        result.error(
                            "READ_ERROR",
                            e.message ?: "Не удалось прочитать файл",
                            null
                        )
                    }
                }

                else -> {
                    result.notImplemented()
                }
            }
        }

        handleIncomingIntent(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        handleIncomingIntent(intent)
    }

    private fun handleIncomingIntent(intent: Intent?) {
        if (intent == null) return

        val action = intent.action ?: return

        if (action != Intent.ACTION_VIEW && action != Intent.ACTION_SEND) {
            return
        }

        val uri: Uri? = when (action) {
            Intent.ACTION_SEND -> getSendUri(intent)
            else -> intent.data
        }

        if (uri != null) {
            pendingUri = uri.toString()
            pendingName = queryDisplayName(uri)
        }
    }

    @Suppress("DEPRECATION")
    private fun getSendUri(intent: Intent): Uri? {
        return intent.getParcelableExtra<Uri>(Intent.EXTRA_STREAM)
    }

    private fun queryDisplayName(uri: Uri): String? {
        return try {
            contentResolver.query(
                uri,
                arrayOf(OpenableColumns.DISPLAY_NAME),
                null,
                null,
                null
            )?.use { cursor ->
                val index = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME)

                if (index >= 0 && cursor.moveToFirst()) {
                    cursor.getString(index)
                } else {
                    null
                }
            }
        } catch (_: Exception) {
            null
        }
    }
}