#  二叉树算法
**框架**
(```)
fileprivate class TreeNode {
    var val: Int?
    var left: TreeNode?
    var right: TreeNode?
}
fileprivate func traverse(root: TreeNode) {
    // 前序遍历
    traverse(root: root.left!)
    // 中序遍历
    traverse(root: root.right!)
    // 后续遍历
}
(```)
