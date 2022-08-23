#!/usr/bin/python

# Program:     classes.py
# Written by:  jdwright
# Purpose:     

from random import *
import math
import numpy
import scipy
import pylab


class Vowel:
    "vowel info"
    def __init__(self,x,y,a,b,rot):
	"initialize Vowel"
	self.x = x
	self.y = y
#	self.inv_ecc = 1/ecc # invert the eccentricity
#	self.scale = sc # distance from directrix
	self.rotation = rot
	self.a = a
	self.b = b
	self.distance = None
    def generate(self,num=1):
	rval = []
	xx = []
	yy = []
	if self.a > self.b:
	    rc = self.a
	else:
	    rc = self.b
	for i in range(1,num):
	    #t = cunifvariate(0,2*math.pi)
	    #t = (0 + 2*math.pi * (random() - 0.5)) % math.pi
	    t = 2*math.pi * random()
	#r = self.sc / (self.inv_ecc + sin(theta+self.rot))
	    re = math.sqrt( 1/((math.cos(t)/self.a)**2 + (math.sin(t)/self.b)**2) )
	    r = rc * random()
	    if r > re:
		continue
	    x = int( r*math.cos(t+self.rotation) + self.x )
	    y = int( r*math.sin(t+self.rotation) + self.y )
	    rval.append( (x,y) )
#	    xx.append(x)
#	    yy.append(y)
	return rval
#    def update(self,p):
#	self.x += p[0] > self.x ? 1 : -1
#	self.y += p[1] > self.y ? 1 : -1
    def distance2midpoint(self,p):
	return sqrt( (self.x-p[0])**2 + (self.y-p[1])**2 )
    def distance2edge(self,p):
	xd = p[0] - self.x
	yd = p[1] - self.y
	t = math.atan( xd / yd ) - self.rotation
	r = math.sqrt( 1/((math.cos(t)/self.a)**2 + (math.sin(t)/self.b)**2) )
	return math.sqrt( xd**2 + yd**2 ) - r
#	self.distance = d
#	return d
#    def contains(self,p):
#	return self.distance2edge(p) <= 0
	

class Person:
   "person"
   vowels = [] # list of vowels
   tokens = [] # maps morphemes to phonemes
   # vowel_space, physical limits
   # Pcd
   def __init__(self):
       self.bin_threshold = 5
       self.tokens = []
       self.xbin = 10
       self.ybin = 10
       self.vowels = []
#   def create_vowel(self,t,a,b,rot):
#       self.tokens[t]
   def produce(self,t,num=1):
       "produce vowel for token"
       v = self.tokens[t]
       return v.generate(num)
   def hear(self,p,t,pcd):
       # this is the stage at which the person's knowledge affects perception
       pcd *= self.Pcd
       if isinstance(self.tokens[t],Vowel) and random() < pcd: # person knows token
#	   if random() < pcd: # token determined by context unambiguously
	   self.perceive(p,self.tokens[t])
       else: # determine distance to phonemes
	   distances = []
	   vowels = []
	   for v in self.vowels:
	       d = v.distance2edge(p)
	       distances.append(d)
	       if d <= 0:
		   vowels.append(v)
	   num = len(vowels)
	   if num == 0: # doesn't match any vowel
	       m = max(distances) + 1
	       Pdis = map( lambda x: x/m , distances )
	       ran = random()
	       mx = 0
	       i = -1
	       for p in Pdis: #find greatest one that random num is greater than
		   i += 1
		   if ran > p and p > mx:
		       mx = i
	       self.perceive(p,self.vowels[i])
	   elif num == 1: # matches one vowel
	       one = random() < self.Phassensible
	       two = random() < self.Pconf1
	       three = random() < self.Pconf2
	       if (one and two) or ((not one) and three):
		   i = self.vowels.index(self.tokens[t])
		   vowels2 = self.vowels[:]
		   del vowels2[i]
		   self.perceive(p,choice(vowels2))
	       elif one and (not two):
		   self.perceive(p,vowels[0])
	       else: # learn token, assume it's the intended one (for now)
		   self.tokens[t] = vl
		   self.perceive(p,vowels[0])
	   else: # matches more than one vowel
	       # should parallel single match, but the P of looking to other phonemes
	       # should be very low, and so for now i assume it's zero
	       vl = choice(vowels)
	       if random() > self.Phassensible2: # learn
		   self.tokens[t] = vl
	       self.perceive(p,vl)
   def perceive(self,p,t):
       # at this stage, perceived t is fixed, whether right or wrong
       self.update(p,self.tokens[t])
   def update(self,p,v):
       # update value of vowel
       v.update(p)
   def points2bins(self,points):
       bins = {}
       list = []
       for p in points:
	   p2 = (p[0]/self.xbin,p[1]/self.ybin)
	   if bins.has_key(p2):
	       bins[p2] += 1
	   else:
	       bins[p2] = 1
       for k in bins.keys():
	   if bins[k] > self.bin_threshold:
	       list.append( (k[0]*self.xbin,k[1]*self.ybin) )
       return list
   def cluster1(self,points):
       """takes a list of points, returns a list of lists, each sublist being a cluster
       first the "central" points are calculated
       then, each cluster is a contiguous set of central points"""   
       central = []
       for p in points:
	   x1 = p[0]-self.xbin
	   x2 = p[0]+self.xbin
	   y1 = p[1]-self.ybin
	   y2 = p[1]+self.ybin
	   num = 0
	   for b in [ (x1,y1), (x1,y2), (x1,p[1]), (x2,y1), (x2,y2), (x2,p[1]), (p[0],y1), (p[0],y2) ]:
	       if b in points:
		   num += 1
	   if num >= 6 and p not in central:
	       central.append(p)
       found = []
       sets = []
       shuffle(central)
       for p in central:
	   if p not in found:
	       stack = [ p ]
	       set = []
	       while len(stack):
		   p2 = stack.pop()
		   x1 = p2[0]-self.xbin
		   x2 = p2[0]+self.xbin
		   y1 = p2[1]-self.ybin
		   y2 = p2[1]+self.ybin
		   for b in [ (x1,y1), (x1,y2), (x1,p[1]), (x2,y1), (x2,y2), (x2,p[1]), (p[0],y1), (p[0],y2) ]:
		       if b in central and b not in set:
			   set.append(b)
			   stack.append(b)
			   found.append(b)
	       sets.append(set)
       return sets

   def cluster2(self):
       "probably don't need this one now, older version of the above algorithm"
       num = 0
       self.bins2phonemes = {}
       stack = []
       self.phonemes_x = {}
       self.phonemes_y = {}
       for b1 in self.bins_list2:
	   if self.bins2phonemes.has_key(b1):
	       continue
	   num += 1
	   self.bins2phonemes[b1] = num
	   self.phonemes2bins[num] = [ b1 ]
	   self.phonemes_x[num] = [ b1[0] ]
	   self.phonemes_y[num] = [ b1[1] ]
	   stack.append(b1)
	   while len(stack):
	       b2 = stack.pop()
	       x1 = b2[0]-1
	       x2 = b2[0]+1
	       y1 = b2[1]-1
	       y2 = b2[1]+1
	       for b3 in [ (x1,y1), (x1,y2), (x1,b[1]), (x2,y1), (x2,y2), (x2,b[1]), (b[0],y1), (b[0],y2) ]:
		   if b3 in self.bins_list2 and not self.bins2phonemes.has_key(b3):
		       self.bins2phonemes[b3] = num
		       self.phonemes2bins[num].append(b3)
		       self.phonemes_x[num].append(b3[0])
		       self.phonemes_y[num].append(b3[1])
		       stack.append(b3)
       self.num_phonemes = num
   def estimate_ellipse_old(self,x,y):
       (sl,icept,r) = linregress(x,y)
       rot = atan(sl)
       mx_x = max(x)
       mn_x = min(x)
       mx_y = sl*mx_x + icept
       mn_y = sl*mn_x + icept
       a = sqrt( (mx_x-mn_x)**2 + (mx_y-mn_y)**2 )
       b = (1-r**2) * a
       return (a,b,rot)
   def estimate_ellipse(self,points):
       x,y = ([],[])
       for p in points:
	   x.append(p[0])
	   y.append(p[1])
       a = abs(max(x)-min(x))
       b = abs(max(y)-min(y))
       area = a*b
       rotation = 0
       x_mid = (max(x)+min(x))/2
       y_mid = (max(y)+min(y))/2
       for i in range(1,19):
	   rot = numpy.pi/20 * i
	   for j in range(0,len(x)-1):
	       theta = math.atan(float(y[j])/float(x[j]))
	       if x[j] < 0:
		   theta += math.pi
	       r = math.sqrt(x[j]**2 + y[j]**2)
	       xx = int(r*math.cos(theta+rot))
	       yy = int(r*math.sin(theta+rot))
#	       print xx,theta,rot,r,y[j],x[j]
	       if j == 0:
		   x_max = xx
		   x_min = xx
		   y_max = yy
		   y_min = yy
	       else:
		   if xx > x_max:
		       x_max = xx
		   if xx < x_min:
		       x_min = xx
		   if yy > y_max:
		       y_max = yy
		   if yy < y_min:
		       y_min = yy
	   a2 = abs(x_max-x_min)
	   b2 = abs(y_max-y_min)
	   area2 = a2*b2
	   if area2 < area:
	       area = area2
	       a = a2
	       b = b2
	       rotation = rot
       return (x_mid,y_mid,a/2,b/2,rotation)
   def estimate_ellipse_old2(self,x,y):
       mx = max( max(x)-min(x), max(y)-min(y) )
       mid_x = (max(x)+min(x))/2
       mid_y = (max(y)+min(y))/2
       x = numpy.array(x)
       y = numpy.array(y)
       x -= mid_x
       y -= mid_y
       min_val, val_a, val_b, val_rot = (10**10, 0, 0, 0)
       for a in numpy.arange(1,mx):
	   for b in numpy.arange(1,mx):
	       for c in numpy.arange(1,20):
		   rot = numpy.pi/20 * c
		   rdiffsum = 0
		   for i in numpy.arange(0,len(x)-1):
		       theta = math.atan(y[i]/x[i])
		       xyr = numpy.sqrt(x[i]**2+y[i]**2)
		       r = numpy.sqrt(1/( numpy.cos(rot)**2/a**2 + numpy.sin(rot)**2/b**2 ))
		       rdiff = r - xyr
		       if rdiff < 0:
			   rdiff *= -10
		       rdiffsum += rdiff
		   if rdiffsum < min_val:
		       min_val, val_a, val_b, val_rot = (rdiffsum,a,b,rot)
       return (a,b,rot)
		       

class Interaction:
    "defines interaction between two people"
    token_limit = 100
    token_num = 1000
    Pcd = .5
    def __init__(self,a,b):
	self.a = a
	self.b = b
    def interact(self,speaker,hearer):
	# sequence of uni-directional "speak-hear-token" acts
	for i in range(1,randrange(self.token_limit)):
	    token = randrange(self.token_num)
	    hearer.hear(speaker.produce(token),token,self.Pcd)
    def a2b(self):
	self.interact(self.a,self.b)
    def b2a(self):
	self.interact(self.b,self.a)
    def normal(self):
	self.a2b()
	self.b2a()
    
	
