\name{importance}
\alias{importance}
\alias{importance.default}
\alias{importance.randomForest}
\title{Extract variable importance measure}
\description{
  This is the extractor function for variable importance measures as
  produced by \code{\link{randomForest}}.
}
\usage{
\method{importance}{randomForest}(x, type=NULL, class=NULL, scale=TRUE, ...)
}
\arguments{
  \item{x}{an object of class \code{\link{randomForest}}}.
  \item{type}{either 1 or 2, specifying the type of importance measure
    (1=mean decrease in accuracy, 2=mean decrease in node impurity).}
  \item{class}{for classification problem, which class-specific measure
    to return.}
  \item{scale}{For permutation based measures, should the measures be
    divided their ``standard errors''?}
  \item{...}{not used.}
}
\value{
  A (named) vector of importance measure, one for each predictor variable.
}
\details{
  Here are the definitions of the variable importance measures.  For
  each tree, the prediction accuracy on the out-of-bag portion of the
  data is recorded.  Then the same is done after permuting each
  predictor variable.  The difference between the two accuracies are
  then averaged over all trees, and normalized by the standard
  error.  For regression, the MSE is computed on the out-of-bag data for
  each tree, and then the same computed after permuting a variable.  The
  differences are averaged and normalized by the standard error.  If the
  standard error is equal to 0 for a variable, the division is not done
  (but the measure is almost always equal to 0 in that case).

  The second measure is the total decrease in node impurities from
  splitting on the variable, averaged over all trees.  For
  classification, the node impurity is measured by the Gini index. 
  For regression, it is measured by residual sum of squares.
}
%\references{
%}
\seealso{
  \code{\link{randomForest}}, \code{\link{varImpPlot}}
}
\examples{
set.seed(4543)
data(mtcars)
mtcars.rf <- randomForest(mpg ~ ., data=mtcars, ntree=1000, 
                          keep.forest=FALSE, importance=TRUE)
importance(mtcars.rf)
importance(mtcars.rf, type=1)
}
%\author{}
\keyword{regression}
\keyword{classif}
\keyword{tree}

