from queue import Queue


class Graph(object):
    """A minimal graph using adjacency lists."""

    def __init__(self, nodes=[], edges=[]):
        self.nodes = nodes
        self.adjacency_list = {n: [tail for (head, tail) in edges if head == n] for n in nodes}

    def successors(self, node):
        """Return a list of successors."""
        return self.adjacency_list[node]

    def predecessor(self, node):
        """Return a list of predecessors."""
        # shown for completeness. If this function is called often, this is the wrong data structure.
        return [head for head in self.nodes if node in self.successors(head)]

    def add_node(self, node):
        self.nodes.append(node)
        self.adjacency_list[node] = []

    def add_edge(self, edge):
        self.adjacency_list[ edge[0] ].append(edge[1])

    def print_self(self):
        print(self.nodes)
        print(self.adjacency_list)


def bfs(graph, start):
    remaining_nodes = Queue()
    visited = set()
    spanning = Graph([], [])
    weights = {start: 0}

    def visit(node, distance):
        print(node)
        visited.add(node)
        spanning.add_node(node)
        for tail in graph.successors(node):
            if tail not in visited:
                remaining_nodes.put(tail)
                spanning.add_edge( (node, tail) )
                weights[tail] = distance + 1

        return distance+1

    remaining_nodes.put(start)
    distance = 0
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        distance = visit(n, distance)

    return (spanning, weights)

g = Graph(['a', 'b', 'c', 'd', 'e'], [('a', 'b'), ('a', 'c'), ('b', 'd'), ('b', 'e'), ('e', 'a')])
g.print_self()


newGraph, weights = bfs(g, 'a')
newGraph.print_self()
print( weights )
