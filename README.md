About ambertoolsml
==================

Home: http://ambermd.org/AmberTools.php

Package license: Multiple

Feedstock license: [BSD-3-Clause](https://github.com/deepmd-kit-recipes/ambertoolsml-feedstock/blob/master/LICENSE.txt)

Summary: AmberTools is a set of programs for biomolecular simulation and analysis

AmberTools is a set of programs for biomolecular simulation and analysis.
They are designed to work well with each other, and with the "regular" Amber
suite of programs. You can perform many simulation tasks with AmberTools,
and you can do more extensive simulations with the combination of AmberTools
and Amber itself.


Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_build/latest?definitionId=&branchName=master">
            <img src="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_apis/build/status/ambertoolsml-feedstock?branchName=master">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64_cuda_compiler_version10.1python3.7.</td>
              <td>
                <a href="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_build/latest?definitionId=&branchName=master">
                  <img src="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_apis/build/status/ambertoolsml-feedstock?branchName=master&jobName=linux&configuration=linux_64_cuda_compiler_version10.1python3.7._" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_cuda_compiler_version10.1python3.8.</td>
              <td>
                <a href="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_build/latest?definitionId=&branchName=master">
                  <img src="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_apis/build/status/ambertoolsml-feedstock?branchName=master&jobName=linux&configuration=linux_64_cuda_compiler_version10.1python3.8._" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_cuda_compiler_version10.1python3.9.</td>
              <td>
                <a href="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_build/latest?definitionId=&branchName=master">
                  <img src="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_apis/build/status/ambertoolsml-feedstock?branchName=master&jobName=linux&configuration=linux_64_cuda_compiler_version10.1python3.9._" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_cuda_compiler_versionNonepython3.7.</td>
              <td>
                <a href="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_build/latest?definitionId=&branchName=master">
                  <img src="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_apis/build/status/ambertoolsml-feedstock?branchName=master&jobName=linux&configuration=linux_64_cuda_compiler_versionNonepython3.7._" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_cuda_compiler_versionNonepython3.8.</td>
              <td>
                <a href="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_build/latest?definitionId=&branchName=master">
                  <img src="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_apis/build/status/ambertoolsml-feedstock?branchName=master&jobName=linux&configuration=linux_64_cuda_compiler_versionNonepython3.8._" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_64_cuda_compiler_versionNonepython3.9.</td>
              <td>
                <a href="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_build/latest?definitionId=&branchName=master">
                  <img src="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_apis/build/status/ambertoolsml-feedstock?branchName=master&jobName=linux&configuration=linux_64_cuda_compiler_versionNonepython3.9._" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-ambertoolsml-green.svg)](https://anaconda.org/ambertoolsml/ambertoolsml) | [![Conda Downloads](https://img.shields.io/conda/dn/ambertoolsml/ambertoolsml.svg)](https://anaconda.org/ambertoolsml/ambertoolsml) | [![Conda Version](https://img.shields.io/conda/vn/ambertoolsml/ambertoolsml.svg)](https://anaconda.org/ambertoolsml/ambertoolsml) | [![Conda Platforms](https://img.shields.io/conda/pn/ambertoolsml/ambertoolsml.svg)](https://anaconda.org/ambertoolsml/ambertoolsml) |

Installing ambertoolsml
=======================

Installing `ambertoolsml` from the `ambertoolsml` channel can be achieved by adding `ambertoolsml` to your channels with:

```
conda config --add channels ambertoolsml
conda config --set channel_priority strict
```

Once the `ambertoolsml` channel has been enabled, `ambertoolsml` can be installed with:

```
conda install ambertoolsml
```

It is possible to list all of the versions of `ambertoolsml` available on your platform with:

```
conda search ambertoolsml --channel ambertoolsml
```




Updating ambertoolsml-feedstock
===============================

If you would like to improve the ambertoolsml recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`ambertoolsml` channel, whereupon the built conda packages will be available for
everybody to install and use from the `ambertoolsml` channel.
Note that all branches in the deepmd-kit-recipes/ambertoolsml-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@njzjz](https://github.com/njzjz/)

