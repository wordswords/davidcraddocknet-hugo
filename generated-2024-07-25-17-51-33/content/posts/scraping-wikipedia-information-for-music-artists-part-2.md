---
category:
  - tutorials
date: "2008-09-22T23:04:45+00:00"
guid: http://www.davidcraddock.net/?p=20
title: Scraping Wikipedia Information for music artists, Part 2
url: /2008/09/22/scraping-wikipedia-information-for-music-artists-part-2/

---
I've abandoned the previous Wikipedia scraping approach for Brightonsound.com, as it was unreliable and didn't pinpoint the right Wikipedia entry - ie: a band called 'Horses' would pull up a Wikipedia bio on the animal - which doesn't look very professional. So instead, I have used the Musicbrainz API to retrieve some information on the artist; the homepage URL, the correct Wikipedia entry, and any genres/terms the artist has been tagged with.

It would be simple to extend this to fetch the actual bio from a site like DBpedia.org (which provides XML-tagged Wikipedia data), now that you always have the correct Wikipedia page reference to fetch the data from.

(You will need to download the Musicbrainz python library to use this code):

```
import time
import sys
import logging
from musicbrainz2.webservice import Query, ArtistFilter, WebServiceError
import musicbrainz2.webservice as ws
import musicbrainz2.model as m

class scrapewiki2(object):

  def __init__(self):
    pass

  def getbio(self,artist):

    time.sleep(2)
    art = artist
    logging.basicConfig()
    logger = logging.getLogger()
    logger.setLevel(logging.DEBUG)

    q = Query()

    try:
      # Search for all artists matching the given name. Limit the results
      # to the 5 best matches. The offset parameter could be used to page
      # through the results.
      #
      f = ArtistFilter(name=art, limit=1)
      artistResults = q.getArtists(f)
    except WebServiceError, e:
      print 'Error:', e
      sys.exit(1)

    # No error occurred, so display the results of the search. It consists of
    # ArtistResult objects, where each contains an artist.
    #

    if not artistResults:
      print "WIKI SCRAPE - Couldn't find a single match!"
      return ''

    for result in artistResults:
      artist = result.artist
      print "Score     :", result.score
      print "Id        :", artist.id
      try:
        print "Name      :", artist.name.encode('ascii')
      except Exception, e:
      print 'Error:', e
      sys.exit(1)

    print "Id         :", artist.id
    print "Name       :", artist.name
    print

    #
    # Get the artist's relations to URLs (m.Relation.TO_URL) having the relation
    # type 'http://musicbrainz.org/ns/rel-1.0#Wikipedia'. Note that there could
    # be more than one relation per type. We just print the first one.
    #
    wiki = ''
    urls = artist.getRelationTargets(m.Relation.TO_URL, m.NS_REL_1+'Wikipedia')
    if len(urls) > 0:
      print 'Wikipedia:', urls[0]
      wiki = urls[0]

    #
    # List discography pages for an artist.
    #
    disco = ''
    for rel in artist.getRelations(m.Relation.TO_URL, m.NS_REL_1+'Discography'):
      disco = rel.targetId
      print disco

    try:
      # The result should include all official albums.
      #
      inc = ws.ArtistIncludes(
        releases=(m.Release.TYPE_OFFICIAL, m.Release.TYPE_ALBUM),
        tags=True)
      artist = q.getArtistById(artist.id, inc)
    except ws.WebServiceError, e:
      print 'Error:', e
      sys.exit(1)

    tags = artist.tags

    toret = ''
    if(wiki):
      toret = ''+art+' Wikipedia Articlen'
    if(disco):
      toret = toret + ''+art+' Main Siten'
    if(tags):
      toret = toret + '
Tags: '+(','.join(t.value for t in tags))+'n'
    return toret

sw2 = scrapewiki2()

# unit test
print sw2.getbio('Blur')
print sw2.getbio('fatboy slim')

```

PS:
Apologies to the person that left several comments on the previous wikipedia scraping post, I have disabled comments temporarily for now due to heavy amounts of spam, but you can contact me using the following address: david@paul@craddock@googlemail.com (subsitute first two @s for '.'s ). I also hope this post answers your question.
