# 0hy.es
![Anchore Container Scan](https://github.com/sabbene/0hy.es/workflows/Anchore%20Container%20Scan/badge.svg)
![Perl Tidy](https://github.com/sabbene/0hy.es/workflows/Perl%20Tidy/badge.svg)
![Perl Tidy](https://github.com/sabbene/0hy.es/workflows/Super%20Linter/badge.svg)

git repo for google cloud run to build 0hy.es from

## tides.pl

Terrible Perl to get noaa weather and tides for fishing spots.

## Handy Commands
### Perl Tidy
<pre>
docker build -t 0hy.es . && docker run -it -v /Users/sabbene/git/0hy.es:/tmp/ --net=host 0hy.es sh -c "cd /app/src/tides/local/bin && carton run ./perltidy -b -bext=\'/\' /tmp/app/src/tides/tides.pl"
</pre>

### Perl Critic
<pre>
docker build -t 0hy.es . && docker run -it -v /Users/sabbene/git/0hy.es:/tmp/ --net=host 0hy.es sh -c "cd /app/src/tides/local/bin && carton run ./perlcritic --brutal /tmp/app/src/tides/tides.pl"
</pre>
