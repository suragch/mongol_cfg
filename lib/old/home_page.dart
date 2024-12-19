// import 'package:flutter/material.dart';
// import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
// import 'package:mongol_cfg/home_page_manager.dart';
// import 'package:mongol_cfg/node.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final manager = HomePageManager();
//   late final TreeController<Node> treeController;

//   @override
//   void initState() {
//     super.initState();
//     treeController = TreeController<Node>(
//       roots: manager.nodes,
//       childrenProvider: (node) => node.children,
//     );
//   }

//   @override
//   void dispose() {
//     treeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: TreeView<Node>(
//         treeController: treeController,
//         nodeBuilder: (BuildContext context, TreeEntry<Node> entry) {
//           return MyTreeTile(
//             key: ValueKey(entry.node),
//             entry: entry,
//             onTap: () => treeController.toggleExpansion(entry.node),
//           );
//         },
//       ),
//     );
//   }
// }

// class MyTreeTile extends StatelessWidget {
//   const MyTreeTile({
//     super.key,
//     required this.entry,
//     required this.onTap,
//   });

//   final TreeEntry<Node> entry;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: TreeIndentation(
//         entry: entry,
//         guide: const IndentGuide.connectingLines(indent: 16),
//         child: Row(
//           children: [
//             FolderButton(
//               isOpen: entry.hasChildren ? entry.isExpanded : null,
//               onPressed: entry.hasChildren ? onTap : null,
//             ),
//             Text(entry.node.title),
//           ],
//         ),
//       ),
//     );
//   }
// }
