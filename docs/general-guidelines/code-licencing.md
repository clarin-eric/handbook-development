# Code licence

-   Each code (including docker image/compose) or documentation project MUST be explicitly licenced
    -   Git repositories should have a LICENCE file if a single licence applies to the entire repo
    -   Docker: see below
-   Default licence (see also ​​[https://www.clarin.eu/programmers](https://www.clarin.eu/programmers)):
    -   For code: GPLv3 \[Policy\]
        -   Exception: if not compatible with libraries or other context
        -   Includes bundled documentation (readme, change log etc)
    -   For documentation projects: CC0
        -   e.g. [https://github.com/clarin-eric/cereal](https://github.com/clarin-eric/cereal)
        -   Put licence statement in footer of document itself
            -   Note: in some cases (e.g. GPL??) licence itself must also be bundled
-   Tooling
    -   [https://www.fossology.org/](https://www.fossology.org/)
    -   Licence compliance
        -   e.g. maven licence plugin
        -   GitHub community standards check
    -   Licence compatibility
        -   check for conflicting licences
            -   [https://dwheeler.com/essays/floss-license-slide.html](https://dwheeler.com/essays/floss-license-slide.html)

## Docker image repositories

For docker images, we generally publish code (the Dockerfile itself, scripts, configuration files, CI configuration, etc) for images under a GPL3 licence (see above). However we typically also openly distribute the built image via a GitLab container registry. In this approach, there is no straightforward way of attaching a licence or terms of use to an image. To mitigate this, we include a statement in the repository regarding the responsibility in terms of use and redistribution of the image in its built form. See the Docker section of this handbook for the exact guideline.

\----------------\-----8<-------\--------\-- For the Docker section \-----------------------------------------

For images that are deployed to a public container registry (i.e. submitted to the GitLab container registry typically via a CI job which is the case for virtually all of our central infrastructure images):

-   Create a file README.legal.txt based on the following template:

    View the \[licence information\](LICENSE.md) for the source code used to build this image.

    <If applicable>
    View the \[licence information\](<link to licence for software>) for the software included in this image.
    </If applicable>

    An image built from the sources in this repository is distributed by CLARIN. As with all Docker images, this likely also contains other software which may be under other licences (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

    As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licences for all software contained within.

-   Add a reference to README.legal.txt to the README file of the repository, e.g. in a section titled ‘Licence’.
-   Add the README.legal.txt file (???) to the root of the image’s file system (i.e. COPY that file into the image via the Dockerfile).  Add a symbolic link from the WORKDIR.
-   Also copy the LICENSE.md file to the root of the image’s file system

\----------------------------------------- For the Docker section ----------------------------->8---------
