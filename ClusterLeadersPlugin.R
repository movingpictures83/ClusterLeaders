library(rlist)

collect.mcl.leaders <- function (M      # Matrix (mcl result)
                                 ) {
  M.names <- row.names(M);
  leaders.list <- vector();
  #clustered.nodes <- vector(mode = "logical", length = dim(M)[1])
  leaders.list <- c(leaders.list, M.names[which(rowSums(M) != 0)]); # I think it is this easy
  #for (i in 1:length(M)) {
    #N <- as.matrix(as.numeric(M[i]));
  #  nodes <- M.names[which(Reduce('+', M[i,]) != 0)];
  #  if (length(nodes) >= 1 && !clustered.nodes[which(M[i,] != 0)]) {
  #              #Add the nodes to the cluster list
  #              leaders.list <- c(leaders.list, M.names[i]);
  #              clustered.nodes[which(M[i,] != 0)] = T;
  #      }
  #}
  return(leaders.list);
}



input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1]
  numclusters <<- as.integer(parameters["numclusters", 2])
  list2 <<- list()
  pos <- 0;
  for (j in 1:numclusters) {
  tmplist <- read.csv(paste(toString(parameters["clusters",2]),j,"values.csv",sep="."), header=T)
  #singlelist <<- tmplist[,2]
  #numclusters <- 0
  #for (i in 1:length(singlelist)) {
     #if (is.na(tmplist[,1][i])) {
     #   list2 <<- list.append(list2, c());
     #   pos <- pos + 1;
     #}
     #else {
        #list2[[pos]] <<- append(list2[[pos]], as.character(singlelist[[i]]));
     #}
  #      numclusters <- numclusters + 1;
  #   }
   #rn <- row.names(tmplist)
   cn <- colnames(tmplist)
   cn <- cn[2:length(cn)]
   tmplist <- tmplist[,-1]
   tmplist <- apply(tmplist, 1, as.numeric)
   tmplist <- t(tmplist)
   tmplist <- as.matrix(tmplist)
   row.names(tmplist) <- cn
   list2 <<- list.append(list2, tmplist);#as.matrix(tmplist));
  }
  #list2 <<- as.matrix(list2)
}

run <- function() {
   leaders <<- c()
   for (j in 1:numclusters) {
   leaders <<- c(leaders, collect.mcl.leaders(list2[[j]]))
   }
}


output <- function(outputfile) {
   for (j in 1:numclusters) {
   if (j == 1) {
   write.table(leaders[j], outputfile, sep=",", append=FALSE, col.names=NA, na="");
   }
   else {
   write.table(leaders[j], outputfile, sep=",", append=TRUE, col.names=NA, na="");
   }
}
}

