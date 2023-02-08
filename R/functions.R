# External functions

euclidean <- function(a, b) sqrt(sum((a - b)^2))

#https://www.dataanalytics.org.uk/make-transparent-colors-in-r/
t_col <- function(color, percent = 50, name = NULL) {
  #      color = color name
  #    percent = % transparency
  #       name = an optional name for the color
  
  ## Get RGB values for named color
  rgb.val <- col2rgb(color)
  
  ## Make new color using input color as base and alpha set by transparency
  t.col <- rgb(rgb.val[1], rgb.val[2], rgb.val[3],
               max = 255,
               alpha = (100 - percent) * 255 / 100,
               names = name)
  
  ## Save the color
  invisible(t.col)
}

#Using function provided by: Andrea Rau, Antoine Godichon-Baggioni, https://github.com/andreamrau/coseq/blob/master/R/general-functions.R
clusterInertia <- function(profiles, clusters) {
  inertia <- NULL
  ## TODO: check that the length of clusters equals profiles
  for(k in seq_len(max(clusters))){
    II <- which(clusters==k)
    if(length(II) > 1) {
      tmp <- as.matrix(profiles[II,])
      inertia <- c(inertia, sum(t(t(tmp) - colMeans(tmp))^2))
    } else inertia <- c(inertia, 0)
  }
  return(inertia)
}

#updated version of tokenizer: modification of the regex for splitting (adding numbers)
#origin: stylo package

#updated version of tokenizer: modification of the regex for splitting (adding numbers)
#origin: stylo package

txt.to.words2 = function(input.text,
                         splitting.rule = NULL,
                         preserve.case = FALSE) {
  #
  
  
  # since the function can be applied to lists and vectors,
  # we need to define an internal function that will be applied afterwards
  wrapper = function(input.text = input.text, splitting.rule = splitting.rule,
                     preserve.case = preserve.case) {
    
    # converting characters to lowercase if necessary
    if (!(preserve.case)){
      input.text = tryCatch(tolower(input.text),
                            error=function(e) NULL)
      if(is.null(input.text) == TRUE) {
        input.text = "empty"
        cat("turning into lowercase failed!\n")
      }
    }
    # if no custom splitting rule was detected...
    if(length(splitting.rule) == 0 ) {
      # splitting into units specified by regular expression; here,
      # all sequences between non-letter characters are assumed to be words:
      splitting.rule = paste("[^A-Za-z0-9",
                             # Latin supplement (Western):
                             "\U00C0-\U00FF",
                             # Latin supplement (Eastern):
                             "\U0100-\U01BF",
                             # Latin extended (phonetic):
                             "\U01C4-\U02AF",
                             # modern Greek:
                             "\U0386\U0388-\U03FF",
                             # Cyrillic:
                             "\U0400-\U0481\U048A-\U0527",
                             # Hebrew:
                             "\U05D0-\U05EA\U05F0-\U05F4",
                             # Arabic/Farsi:
                             "\U0620-\U065F\U066E-\U06D3\U06D5\U06DC",
                             # extended Latin:
                             "\U1E00-\U1EFF",
                             # ancient Greek:
                             "\U1F00-\U1FBC\U1FC2-\U1FCC\U1FD0-\U1FDB\U1FE0-\U1FEC\U1FF2-\U1FFC",
                             # Coptic:
                             "\U03E2-\U03EF\U2C80-\U2CF3",
                             # Georgian:
                             "\U10A0-\U10FF",
                             # Japanese (Hiragana)
                             "\U3040-\U309F",
                             # Japanese (Katagana):
                             "\U30A0-\U30FF",
                             # Japanese repetition symbols:
                             "\U3005\U3031-\U3035",
                             # CJK Unified Ideographs:
                             "\U4E00-\U9FFF",
                             # CJK Unified Ideographs Extension A:
                             "\U3400-\U4DBF",
                             # Hangul (Korean script):
                             "\UAC00-\UD7AF",
                             "]+",
                             sep="")
      tokenized.text = c(unlist(strsplit(input.text, splitting.rule)))
      # if custom splitting rule was indicated:
    } else {
      # sanity check
      if(length(splitting.rule) == 1) {
        # just in case, convert to characters
        splitting.rule = as.character(splitting.rule)
        # splitting into units specified by custom regular expression
        tokenized.text = c(unlist(strsplit(input.text, splitting.rule)))
      } else {
        stop("Wrong splitting regexp")
      }
    }
    # getting rid of emtpy strings
    tokenized.text = tokenized.text[nchar(tokenized.text) > 0]
    
  }
  
  
  
  # the proper procedure applies, depending on what kind of data
  # is analyzed
  
  # test if the dataset has a form of a single string (a vector)
  if(is.list(input.text) == FALSE) {
    # apply an appropriate replacement function
    tokenized.text = wrapper(input.text = input.text,
                             splitting.rule = splitting.rule,
                             preserve.case = preserve.case)
    # if the dataset has already a form of list
  } else {
    # applying an appropriate function to a corpus:
    tokenized.text = lapply(input.text, wrapper,
                            splitting.rule = splitting.rule,
                            preserve.case = preserve.case)
    class(tokenized.text) = "stylo.corpus"
  }
  
  
  
  # outputting the results
  return(tokenized.text)
}

  
  ### Distance to centroid
  
  DistToCentroid = function(x, method="manhattan", centroid = NULL){
    if(is.null(centroid)){
      centroid = rowMeans(x)
    }
    distances = 
      matrix(nrow = ncol(x), ncol=1, dimnames = list(colnames(x),"DistToCentroid"))
    for(i in 1:ncol(x)){
      distances[i,] = dist(rbind(x[,i], centroid), method=method)
    }
    return(distances)
    
}
# Normalisation (source: JB Camps)

normalisations = function(x){
  # Z-transformation  
  x = ZTransf(x)
  
  # Vector length normalisation
  for(i in 1:ncol(x)){
    x[,i] = x[,i] / sqrt(sum(x[,i]^2))
  }
  return(x)
}

# Z-scores
ZTransf = function(x){
  for(i in 1:nrow(x)){
    x[i,] = ( x[i,] - mean(x[i,]) )  / sd(x[i,])
  }
  return(x)
}


