#!/usr/bin/pythonw

# Program:     graph.py
# Written by:  jdwright
# Purpose:     

import scipy
from scipy import stats,optimize
import numpy
from pylab import *
import math
from random import *
from classes import *

def plot_ellipse(x,y,a,b,rot):
    theta = numpy.arange(0.0,numpy.pi*2,0.1) + rot
    r = numpy.sqrt( 1/ (numpy.cos(theta+rot)**2/a**2 + numpy.sin(theta+rot)**2/b**2) )
    plot(r*numpy.cos(theta)+x,r*numpy.sin(theta)+y)

def points2coords(points):
    x = []
    y = []
    for p in points:
	x.append(p[0])
	y.append(p[1])
    return (x,y)

def get_vowelspace(person,bins=0):
    points = []
    if bins:
	for v in person.vowels:
	    points += person.points2bins(v.generate(2000))
    else:
	for v in person.vowels:
	    points += v.generate(2000)
    return points

person_a = Person()
person_b = Person()
person_a.vowels = [
    Vowel(-1800,-500,100,50,math.pi/-4),
    Vowel(-1200,-500,100,50,math.pi/4),
    Vowel(-2000,-300,100,50,math.pi/-4),
    Vowel(-1000,-300,100,50,math.pi/4),
    Vowel(-1500,-700,100,50,0)
    ]
vowel_b = Vowel(-1200,-500,100,50,math.pi/4)

points = get_vowelspace(person_a,1)
x,y = points2coords(points)
scatter(x,y)

sets = person_b.cluster1(points)

x=[];y=[]
for s in sets:
#    xx,yy = points2coords(s)
#    x += xx
#    y += yy
    (x,y,a,b,rot) = person_b.estimate_ellipse(s)
    plot_ellipse(x,y,a,b,rot)

#scatter(x,y,c='r')

show()

#apoints = vowel_a.generate(2000)
#bpoints = vowel_b.generate(2000)

#apoints = person_a.points2bins(apoints)
#bpoints = person_b.points2bins(bpoints)


#scatter(x+xx,y+yy,c='b')
#axis('equal')
#axis([-2500,-500,-900,-300])

#sets = person_b.cluster1(apoints+bpoints)
#apoints = sets[0]
#bpoints = sets[1]

#scatter(x,y,c='r')

#show()

#x = []
#y = []
#for i in range(1,3000):
#    theta = random() * 2 * math.pi
#    r = random() * 5
#    xx = r*numpy.cos(theta)
#    yy = r*numpy.sin(theta)
#    re = math.sqrt(1/( (numpy.cos(theta)**2 / 25) + (numpy.sin(theta)**2 / 2) ))
#    if r > re:
#	continue
#    xx = r*numpy.cos(theta)
#    yy = r*numpy.sin(theta)
#    x.append(xx)
#    y.append(yy)


#scatter(x,y)

#x_mid,y_mid,a,b,rot = person_a.estimate_ellipse(x,y)

#a,b = optimize.anneal(func,(3,3))
#print a,b
#a=5
#b=2
#(a,b,r,s,e) = stats.linregress(x,y)
#print y

