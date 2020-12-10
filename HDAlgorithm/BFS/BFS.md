# 广度优先算法
BFS: 宽度优先搜索，又称广度优先算法


## BFS问题的本质
在一幅【图】中找到从起点【start】到终点【target】的最近距离

## BFS与DFS最主要的区别
BFS找到的路径一定是最短的，但是空间复杂度比DFS大很多


## 框架
(```)
// 计算从起点【start】到终点【target】的最近距离
int BFS(Node start, Node target) {
    // 核心数据结构（队列）
    Queue<Node> q;
    // 避免走回头路（用了集合）
    Set<Node> visited;
    // 将起点加入队列
    q.offer(start);
    visited.add(start);
    // 记录扩散的步数
    int step = 0;
    while (q not empty) {
    int size = q.size();
    // 将当前队列中的所有节点向四周扩散
    for (int i = 0, i < size; i ++) {
        Node current = q.poll();
        // 判断是否到达终点
        if (current is target) { return step; }
        // 将current相邻的节点加入队列
        for (Node x: cuurent.adj()) {
            // 如果相邻节点不在避免回头路的集合中
           if (x not in visited) {
              q.offer(x);
              visited.add(x);
           }
        }
     }
   // ⚠️更新步数在这里(while循环里)
    step++;
  }
}
(```)
注意：  上面框架补充说明：队列 q 就不说了，BFS 的核心数据结构；current.adj() 泛指 current 相邻的节点，比如说二维数组中，current 上下左右四面的位置就是相邻节点；visited 的主要作用是防止走回头路，大部分时候都是必须的，但是像一般的二叉树结构，没有子节点到父节点的指针，不会走回头路就不需要 visited


## 双向BFS优化
双向BFS优化，提高算法效率，但是必须要知道终点是在哪里，才可以使用
