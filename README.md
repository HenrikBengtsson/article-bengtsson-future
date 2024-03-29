![Spell checking status](https://github.com/HenrikBengtsson/article-bengtsson-future/workflows/Spelling/badge.svg)
![LaTeX-to-PDF compile status](https://github.com/HenrikBengtsson/article-bengtsson-future/workflows/LaTeX/badge.svg)

# Article 'A Unifying Framework for Parallel and Distributed Processing in R using Futures'

H. Bengtsson, A Unifying Framework for Parallel and Distributed Processing in R using Futures, [arXiv:2008.00553](https://arxiv.org/abs/2008.00553), 2021

_Abstract_:  
A future is a programming construct designed for concurrent and asynchronous evaluation of code, making it particularly useful for parallel processing. The [future] package implements the Future API for programming with futures in R.  This minimal API provides sufficient constructs for implementing parallel versions of well-established, high-level map-reduce APIs. The future ecosystem supports exception handling, output and condition relaying, parallel random number generation, and automatic identification of globals lowering the threshold to parallelize code. The Future API bridges parallel frontends with parallel backends following the philosophy that end-users are the ones who choose the parallel backend while the developer focuses on what to parallelize. A variety of backends exist and third-party contributions meeting the specifications, which ensure that the same code works on all backends, are automatically supported. The future framework solves several problems not addressed by other parallel frameworks in R.

Status: Accepted ([The R Journal](https://journal.r-project.org/archive/2021/RJ-2021-048/index.html))  
Download: [PDF](https://raw.githubusercontent.com/HenrikBengtsson/article-bengtsson-future/master/release/bengtsson-future.pdf) (latest version; newer that prepublication)  
Prepublication: [PDF](https://arxiv.org/pdf/2008.00553.pdf) (v4 from 2021-11-11)  
Feedback: https://github.com/HenrikBengtsson/article-bengtsson-future/issues  
Changelog: [CHANGELOG](https://github.com/HenrikBengtsson/article-bengtsson-future/blob/master/CHANGELOG.md)  



Please cite this article when using the **[future](https://future.futureverse.org)** package or the future framework as:

```
@article{bengtsson-future,
  author = {Henrik Bengtsson},
  title = {{A Unifying Framework for Parallel and Distributed Processing
          in R using Futures}},
  year = {2021},
  journal = {{The R Journal}},
  doi = {10.32614/RJ-2021-048},
  url = {https://journal.r-project.org/archive/2021/RJ-2021-048/index.html}
}
```

## Instructions

### Edit and view locally

To compile the LaTeX document ('bengtsson-future.tex') into a PDF ('RJwrapper.pdf'), do:

```sh
$ make
```

To view it locally:

```sh
$ make view
```

To cleanup and start from scratch, do:

```sh
$ make clean
```


### The R Journal

To build a tarball to be sent to The R Journal, do:

```sh
$ make submit
```


### arXiv

To build the arXiv PDF without the R Journal header and footer, do:

```sh
$ make arxiv
```

To build the minimal tarball to be uploaded to arXiv, do:

```sh
$ make arxiv.tar.gz
```


[future]: https://cran.r-project.org/package=future
