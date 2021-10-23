# 0hy.es
git repo for google cloud run to build 0hy.es from

## Master branch action statuses
[![Perl Tidy](https://github.com/sabbene/0hy.es/actions/workflows/perltidy.yml/badge.svg?branch=master)](https://github.com/sabbene/0hy.es/actions/workflows/perltidy.yml)
[![Super Linter](https://github.com/sabbene/0hy.es/actions/workflows/superlinter.yml/badge.svg?branch=master)](https://github.com/sabbene/0hy.es/actions/workflows/superlinter.yml)
[![Anchore Container Scan](https://github.com/sabbene/0hy.es/actions/workflows/anchore-analysis.yml/badge.svg?branch=master)](https://github.com/sabbene/0hy.es/actions/workflows/anchore-analysis.yml)

## Stage branch action statuses
[![Perl Tidy](https://github.com/sabbene/0hy.es/actions/workflows/perltidy.yml/badge.svg?branch=stage)](https://github.com/sabbene/0hy.es/actions/workflows/perltidy.yml)
[![Super Linter](https://github.com/sabbene/0hy.es/actions/workflows/superlinter.yml/badge.svg?branch=stage)](https://github.com/sabbene/0hy.es/actions/workflows/superlinter.yml)
[![Anchore Container Scan](https://github.com/sabbene/0hy.es/actions/workflows/anchore-analysis.yml/badge.svg?branch=stage)](https://github.com/sabbene/0hy.es/actions/workflows/anchore-analysis.yml)
[![BuildTest0hy.esContainer](https://github.com/sabbene/0hy.es/actions/workflows/testdocker.yml/badge.svg?branch=stage)](https://github.com/sabbene/0hy.es/actions/workflows/testdocker.yml)

## Dev branch action statuses
[![Perl Tidy](https://github.com/sabbene/0hy.es/actions/workflows/perltidy.yml/badge.svg?branch=dev)](https://github.com/sabbene/0hy.es/actions/workflows/perltidy.yml)
[![Super Linter](https://github.com/sabbene/0hy.es/actions/workflows/superlinter.yml/badge.svg?branch=dev)](https://github.com/sabbene/0hy.es/actions/workflows/superlinter.yml)

## tides.pl

Terrible Perl to get noaa weather and tides for fishing spots.

## Handy Commands
### Interactive container
<pre>
docker build -t 0hy.es . && docker run -it -v /Users/sabbene/git/0hy.es:/tmp/ --net=host -e TZ=America/Los_Angeles 0hy.es sh
</pre>

### These commands don't work anymore.  Need to find replacements
### Perl Tidy
<pre>
docker build -t 0hy.es . && docker run -it -v /Users/sabbene/git/0hy.es:/tmp/ --net=host -e TZ=America/Los_Angeles 0hy.es sh -c 'cpanm install Perl::Tidy; perltidy -b -bext="/" /tmp/app/src/tides/tides.pl'
</pre>

### Perl Critic
<pre>
docker build -t 0hy.es . && docker run -it -v /Users/sabbene/git/0hy.es:/tmp/ --net=host -e TZ=America/Los_Angeles 0hy.es sh -c 'cpanm install Perl::Critic; perlcritic /tmp/app/src/tides/tides.pl'
</pre>
