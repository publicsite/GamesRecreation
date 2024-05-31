#!/bin/sh

wget "https://github.com/VeraVisions/nuclide/archive/refs/heads/master.tar.gz" -O nuclide-master.tar.gz
wget "https://github.com/eukara/freehl/archive/refs/heads/master.tar.gz" -O freehl-master.tar.gz

git clone "https://vcs.vera-visions.com/tech/engine" engine

ODE_VER=0.16.2
ODE_URL=https://bitbucket.org/odedevs/ode/downloads/ode-$(ODE_VER).tar.gz

wget -N "$ODE_URL"

BULLET_VER=2.87
BULLET_URL=https://github.com/bulletphysics/bullet3/archive/$(BULLET_VER).tar.gz

wget -N "$BULLET_URL"

sudo apt-get install libgnutls28-dev libspeex-dev libspeexdsp-dev