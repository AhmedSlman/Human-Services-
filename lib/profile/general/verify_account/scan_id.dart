//
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class ScanId extends StatefulWidget {
//   const ScanId({Key? key, required Null Function(dynamic capturedImage) onCapture}) : super(key: key);
//
//   @override
//   State<ScanId> createState() => _ScanIdState();
// }
//
// class _ScanIdState extends State<ScanId> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   final GlobalKey _containerKey = GlobalKey(); // Key to capture the container
//
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller?.pauseCamera();
//     }
//     controller?.resumeCamera();
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   Future<void> _capturePhoto() async {
//     try {
//       RenderRepaintBoundary boundary =
//       _containerKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//       ui.Image image = await boundary.toImage();
//       ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//       Uint8List uint8List = byteData!.buffer.asUint8List();
//
//       // You can now use the Uint8List `uint8List` to process the image as needed.
//       // For example, display it or send it to a server.
//       print('Photo captured with size: ${uint8List.lengthInBytes} bytes');
//
//       // Display the image in a dialog for example
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           content: Image.memory(uint8List),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     } catch (e) {
//       print('Error capturing photo: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ColorScheme color = Theme.of(context).colorScheme;
//     TextTheme textTheme = Theme.of(context).textTheme;
//
//     return Scaffold(
//       backgroundColor: color.surface,
//       appBar: AppBar(
//         title: Text(
//           'Scan Card',
//           style: textTheme.titleLarge,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: RepaintBoundary(
//           key: _containerKey,
//           child: Container(
//             height: 460,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: const Color(0xffC4C4C4),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: _buildQrView(context),
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
//         child: InkWell(
//           onTap: _capturePhoto,
//           child: Container(
//             height: 48,
//             alignment: Alignment.center,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: const Color(0xffEDE6FD),
//             ),
//             child: Text(
//               'Submit',
//               style: textTheme.titleMedium?.copyWith(
//                 fontWeight: FontWeight.w600,
//                 color: color.primary,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildQrView(BuildContext context) {
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//         MediaQuery.of(context).size.height < 400)
//         ? 300.0
//         : 300.0;
//
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//         borderColor: Colors.red,
//         borderRadius: 10,
//         borderLength: 30,
//         borderWidth: 10,
//         cutOutSize: scanArea,
//       ),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//       debugPrint('Barcode found: ${result?.code}');
//       // Here you can handle the scanned result (e.g., save it, process it, etc.)
//     });
//   }
//
//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('No permission to access camera')),
//       );
//     }
//   }
// }
