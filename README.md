# ClusterLeaders
# Language: R
# Input: TXT (keyword, value pairs)
# Output: CSV (trimmed file)
# Tested with: PluMA 1.1, R 4.0.0
# Dependency: rlist_0.4.6.1

PluMA plugin to take a set of clusters and compute the mean edge weight between them, taking
into account nodes in each pair of clusters.

The plugin accepts as input a TXT file with (keyword, value) pairs.  Two keywords are accepted:

clusters: The prefix of the CSV files for clusters.  Cluster files will then me named:

prefix.1.csv
prefix.2.csv

and so on.

Cluster CSV files are nxn, where n is the number of nodes in the cluster
Rows and columns both represent nodes.  Entry (i, j) is the edge weight from node i to node j.


numclusters: The number of clusters (n)

The output file is a CSV cluster file, with one leader node for each cluster separated by "", "x"

