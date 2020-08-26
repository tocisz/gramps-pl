FROM ubuntu
ADD https://github.com/gramps-project/gramps/releases/download/v5.1.3/gramps_5.1.3-1_all.deb /
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y locales python3-icu language-pack-gnome-pl gir1.2-osmgpsmap-1.0 gir1.2-gexiv2-0.10 graphviz ghostscript python3-graphviz python3-pil fonts-freefont-ttf gir1.2-goocanvas-2.0 python3-networkx python3-pygraphviz \
    && locale-gen pl_PL.utf8
RUN dpkg -i gramps_5.1.3-1_all.deb || apt-get -fy install
VOLUME /root
WORKDIR /root
ENV LANG=pl_PL.utf8
