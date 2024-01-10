#  数据结构
## 基本类型
- 数组、链表
**其他数据结构底层还是数组或者链表**
- 两者的优缺点：
**数组**：数组是连续的内存，可以随机访问，通过下标索引能快速找到对应元素。但是因为内存是连续的，所以分配内存是要一次性分配够，要对数据扩容，则需要分配一份更大的空间，再把数据复制过去，时间复杂度为 O(n)，删除/添加操作，每次都需要搬移删除/添加后面的元素，以保持内存的连续性，所以时间复杂度为O(n)；
**链表**：因为元素是不连续的，靠指针指向下一个元素的位置，所以不存在扩容问题，如果知道某一个元素的前驱和后驱，操作指针就可以删除该元素或者插入新元素，时间复杂度为O(1)；但是因为内存是不连续的，所以无法根据索引来获取元素地址，不能随机访问，而且每个元素必须储存在指向前后元素位置的指针，会消耗更多的存储空间。


## 线性表结构和非线性表结构
- 线性表结构：数据排成一条线那样，有前后两个方向，如数组、链表、队列、栈等
- 非线性表结构：不是排成先，没有前后方向的，如二叉树、堆、图等


## 数据结构的基本操作
**数据结构的操作无非就是增删改查**

- 数组：线性迭代访问 —> 【for、while循环访问】
(```)
func traverse(array: [Any]) {
   for (index, value) in array.enumerated() {
  // 迭代访问 array[i]
  }
}
(```)

- 链表：兼具迭代和递归
(```)
/* 基本的单链表节点 */
class ListNode {
    int val;
    ListNode next;
}
void traverse(ListNode head) {
    for (ListNode p = head; p != null; p = p.next) {
        // 迭代访问 p.val
    }
}
void traverse(ListNode head) {
    // 递归访问 head.val
    traverse(head.next);
}
(```)

- 二叉树：非线性递归遍历
(```)
/* 基本的二叉树节点 */
class TreeNode {
    int val;
    TreeNode left, right;
}
void traverse(TreeNode root) {
    // 前序遍历
    traverse(root.left);
    // 中续遍历
    traverse(root.right);
    // 后续排序
}
(```)


- N叉树：
**N叉树的遍历又可以拓展为图的遍历，因为图就是好几N叉树的结合体；图可能出现环？处理这个问题方法：用布尔数组visited做标记就行了**
(```)
/* 基本的N叉树节点*/
class TreeNode {
   int val;
   TreeNode[] children;
}
void traverse(TreeNode root) {
    for (TreeNode child: root.children)
    traverse(child);
}
(```)
