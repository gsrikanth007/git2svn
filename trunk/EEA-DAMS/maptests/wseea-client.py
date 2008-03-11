#!/usr/bin/env python
import urllib


def makeurl(url, params):
    listparams = [ key + "=" + val for key,val in params.items()]
    return url + '&'.join(listparams)


def getamap(url):
    params = {
    'REQUEST':'GetMap',
    'SERVICE':'WMS',
    'VERSION':'1.1.1',
    'LAYERS':'SM,A7',
    'STYLES':'',
    'FORMAT':'image/png',
    'BGCOLOR':'0xFFFFFF',
    'TRANSPARENT':'TRUE',
    'SRS':'EPSG:4326',
#   'BBOX':'22.5,21.94304553343818,33.75,31.95216223802497',
    'BBOX':'-12.0,34.0,36.0,74.0',
    'WIDTH':'256',
    'HEIGHT':'256',
    'reaspect':'false'
    }
    f = urllib.urlopen(makeurl(url,params))
    d = f.read()
    print f.info()
    f.close()
    mapf = file("testmap.png","wb")
    mapf.write(d)
    mapf.close()

from wmsclient import getcapabilities

if __name__ == '__main__':
    url="http://dampos-demo.eea.europa.eu/cgi-bin/wseea?"
    getcapabilities(url)
    getamap(url)
