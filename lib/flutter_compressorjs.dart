import 'dart:html';
import 'package:js/js.dart';

@JS()
@anonymous
class Options {
  external factory Options({
    /**
     * Indicates whether to output the original image instead of the compressed one when the size of the compressed image is greater than the original one's
     */
    bool? strict,

    /**
     * Indicates if read the image's Exif Orientation information,
     * and then rotate or flip the image automatically.
     * @type {boolean}
     */
    bool? checkOrientation,

    /**
     * Indicates if retain the image's Exif information after compressed.
     * @type {boolean}
     */
    bool? retainExif,

    /**
     * The max width of the output image.
     * @type {number}
     */
    double? maxWidth,

    /**
     * The max height of the output image.
     * @type {number}
     */
    double? maxHeight,

    /**
     * The min width of the output image.
     * @type {number}
     */
    double? minWidth,

    /**
     * The min height of the output image.
     * @type {number}
     */
    double? minHeight,

    /**
     * The width of the output image.
     * If not specified, the natural width of the source image will be used.
     * @type {number}
     */
    double? width,

    /**
     * The height of the output image.
     * If not specified, the natural height of the source image will be used.
     * @type {number}
     */
    double? height,

    /**
     * Sets how the size of the image should be resized to the container
     * specified by the `width` and `height` options.
     * @type {string}
     */
    String? resize,

    /**
     * The quality of the output image.
     * It must be a number between `0` and `1`,
     * and only available for `image/jpeg` and `image/webp` images.
     * Check out {@link https://developer.mozilla.org/en-US/docs/Web/API/HTMLCanvasElement/toBlob canvas.toBlob}.
     * @type {number}
     */
    double? quality,

    /**
     * The mime type of the output image.
     * By default, the original mime type of the source image file will be used.
     * @type {string}
     */
    String? mimeType,

    /**
     * Files whose file type is included in this list,
     * and whose file size exceeds the `convertSize` value will be converted to JPEGs.
     * @type {string｜Array}
     */
    String? convertTypes,

    /**
     * PNG files over this size (5 MB by default) will be converted to JPEGs.
     * To disable this, just set the value to `Infinity`.
     * @type {number}
     */
    double? convertSize,

    /**
     * The hook function to execute when success to compress the image.
     * @type {Function}
     * @param {File} file - The compressed image File object.
     * @example
     * function (file) {
     *   console.log(file);
     * }
     */
    Function(dynamic file)? success,

    /**
     * The hook function to execute when fail to compress the image.
     * @type {Function}
     * @param {Error} err - An Error object.
     * @example
     * function (err) {
     *   console.log(err.message);
     * }
     */
    Function(dynamic error)? error,
  });
}

@JS("Compressor")
class FlutterCompressorJS {
  external factory FlutterCompressorJS(File file, Options opts);
}
