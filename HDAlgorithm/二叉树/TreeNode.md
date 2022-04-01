#  二叉树算法
**框架**
(```)
fileprivate class TreeNode {
    var val: Int?
    var left: TreeNode?
    var right: TreeNode?
}
fileprivate func traverse(root: TreeNode) {
    // 前序遍历（先打印目标节点，再遍历目标节点左子树，后遍历目标右子树）
    traverse(root: root.left!)
    // 中序遍历（先遍历目标节点左子树，再打印目标节点，后遍历目标节点右子树）
    traverse(root: root.right!)
    // 后续遍历（先遍历目标节点左子数，再遍历目标节点右子树，后打印目标节点）
}
(```)



## 树的概念
每个元素称为节点，用线相连的邻节点之间的关系，称为父子关系；通一个父节点的节点，叫兄弟节点；没有父节点的叫根节点，没有子节点的叫叶节点。

节点的高度 = 节点到叶节点的最长路径（边数）
节点的深度 = 根节点到这个节点所经历的边的个数
节点的层数 = 节点的深度+1
树的高度 = 根节点的高度
