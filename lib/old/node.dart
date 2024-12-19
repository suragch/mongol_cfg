class Node {
  const Node({
    // required this.title,
    this.children = const <Node>[],
  });

  // final String title;
  final List<Node> children;
}
