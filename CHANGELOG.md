# Changelog

## Under development (2021-03-21)

* Add a brief introduction to parallelization in R and a few references to
  the history and current solutions.  Clarify that futures operate on the
  R level, which rules out various parallelization frameworks that are only
  accessible at the native-code level.

* Add a figure illustrating how lapply() can be used with futures and how
  they parallelize across for workers.

* Mention the new 'parallelly' package, which includes some of the functions
  that previously were in 'future'.

* Drop the term 'sequential consistency' (Lamport, 1979), which is a term
  with a very specific meaning, and not in the loose sense that it was used
  in the article.

* Add subsection on overhead.

* Mentioning marshaling as a potential solution to some types of
  non-exportable objects.


## arXiv_2008.00553v2 (2020-08-24)

* Version 2 available on arXiv.

* See https://github.com/HenrikBengtsson/article-bengtsson-future/milestone/1
  for updates.


## arXiv_2008.00553v1 (2020-08-04)

* Version 1 available on arXiv.
