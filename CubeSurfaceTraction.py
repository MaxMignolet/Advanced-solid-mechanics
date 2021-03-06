# -*- coding: utf-8 -*-
#################################################
#   Source file for the ASM project             #
#                                               #
#################################################.

from wrap import *
import math                        

metafor = Metafor()
domain = metafor.getDomain()

def getMetafor(p={}): 
    return metafor
    
###########################################
# BEGIN OF DEFINITION OF THE PARAMETERS   #
###########################################

#Remark: The units must be consistent!
#Here, lengths in [mm] ; E in [MPa] and Mass in [Tons]

#GEOMETRY:
p= {} 
p['GeometryHypothesis'] = "PLANESTRESS" #PLANESTRESS or "PLANESTRAIN" ; you need to implement PLANESTRAIN yourself! 
p['EdgeSize'] = 120                     #Length of the cube
#MESH:    
p['Nx'] = 2                             #Nb of elements in the x direction
p['Ny'] = 2                             #Nb of elements in the y direction
p['Nz'] = 2                             #Nb of elements in the z direction
#TIME:
p['dT'] = 0.1                           #Maximum time step                     

###########################################
# END OF DEFINITION OF THE PARAMETERS     #
###########################################

#2.0 GEOMETRY
#===========
geometry = domain.getGeometry() 
geometry.setDim3D()  

#2.1 Points
#----------
pointset = geometry.getPointSet()                               

pointset.define(1,0.,0.,0.)                                     
pointset.define(2,p['EdgeSize'],0.,0.)
pointset.define(3,p['EdgeSize'],p['EdgeSize'],0.)
pointset.define(4,0.,p['EdgeSize'],0.)
pointset.define(5,0.,0.,p['EdgeSize'])
pointset.define(6,p['EdgeSize'],0.,p['EdgeSize'])
pointset.define(7,p['EdgeSize'],p['EdgeSize'],p['EdgeSize'])
pointset.define(8,0.,p['EdgeSize'],p['EdgeSize'])

#2.2 Curves
#-----------
curveset = geometry.getCurveSet()                            

curveset.add( Line( 1, pointset( 1), pointset(2) ))          
curveset.add( Line( 2, pointset( 2), pointset(3) ))          
curveset.add( Line( 3, pointset( 3), pointset(4) ))          
curveset.add( Line( 4, pointset( 4), pointset(1) ))          
curveset.add( Line( 5, pointset( 1), pointset(5) ))          
curveset.add( Line( 6, pointset( 2), pointset(6) ))          
curveset.add( Line( 7, pointset( 3), pointset(7) ))          
curveset.add( Line( 8, pointset( 4), pointset(8) ))          
curveset.add( Line( 9, pointset( 5), pointset(6) ))          
curveset.add( Line( 10, pointset( 6), pointset(7) ))         
curveset.add( Line( 11, pointset( 7), pointset(8) ))          
curveset.add( Line( 12, pointset( 8), pointset(5) ))          

#2.3 Wires
#------------
wireset = geometry.getWireSet()                              

wireset.add( Wire(1, [curveset(1), curveset(2), curveset(3), curveset(4)]) ) 
wireset.add( Wire(2, [curveset(9), curveset(10), curveset(11), curveset(12)]) ) 
wireset.add( Wire(3, [curveset(1), curveset(6), curveset(9), curveset(5)]) ) 
wireset.add( Wire(4, [curveset(2), curveset(7), curveset(10), curveset(6)]) ) 
wireset.add( Wire(5, [curveset(3), curveset(7), curveset(11), curveset(8)]) ) 
wireset.add( Wire(6, [curveset(4), curveset(8), curveset(12), curveset(5)]) ) 

#2.4 Sides
#-------------------
sideset = geometry.getSideSet()                              

sideset.add( Side(1,[wireset(1)]) )                          
sideset.add( Side(2,[wireset(2)]) )                          
sideset.add( Side(3,[wireset(3)]) )                          
sideset.add( Side(4,[wireset(4)]) )                          
sideset.add( Side(5,[wireset(5)]) )                          
sideset.add( Side(6,[wireset(6)]) )                          

#2.5 Skins
#-------------------
skinset = geometry.getSkinSet()

skinset.add( Skin(1,[sideset(1),sideset(2),sideset(3),sideset(4),sideset(5),sideset(6)]))                         

#2.6 Volume
#-------------------
volumeset = geometry.getVolumeSet()

volumeset.add(Volume(1,[skinset(1)]))                        

#3. MESH
#===========

#3.1 Meshing the lines:
#-------------------
for i in [1, 3, 9, 11]:
    SimpleMesher1D(curveset(i)).execute(p['Nx'])                    
for i in [2, 4, 10, 12]:
    SimpleMesher1D(curveset(i)).execute(p['Ny'])                 
for i in [5, 6, 7, 8]:
    SimpleMesher1D(curveset(i)).execute(p['Nz'])                    

#3.2 Meshing the Sides:
#-------------------
for i in range(1,7):
    TransfiniteMesher2D(sideset(i)).execute(True, 0)

#3.3 Meshing the Volume:
#-------------------
TransfiniteMesher3D(volumeset(1)).execute(True)
   
#4.0 MATERIALS
#===========

############################################################
# BEGIN OF DEFINITION OF THE MATERIALS AND MATERIAL LAWS   #
############################################################
# no restrictions on the value taken by the three following variable, except
# that IsoHardening and KinHardening cannot be both zero
# example: 2, 1, 0 -> mixed non-linear isotropic, linear kinematic hardening
# example: 1, 0, 1 -> linear isotropic viscoplastic hardening
# /!\ pure kinematic hardening  doesn't work. A yield stress law for a constant
# :!\ sigma_y have still to be implemented to resolve this issue
IsoHardening = 1 # indicates the isotropic hardening law used
                 # if 1: linear
                 # if 2: non-linear (saturated/Voce)
                 # if 0: no isotropic hardening (simga_y = sigma_y^0)
KinHardening = 0 # indicates the kinematic hardening law used
                 # if 1: linear
                 # if 2: non-linear
                 # if 0: no kinematic hardening (backstress = 0)
Visco = 1       # indicates the viscoplastic law used #still to be implemented
                 # if 1: Perzyna law
                 # if 0: no viscosity effects
Kin_base = 2 # don't modify this!

prescrDisp = 0   # Use prescribed displacement instead of load. Will cancel all loads.

#MATERIAL:   
Density = 7.85E-9           # Density
Young = 20.5E4              # Young's Modulus
Nu = 0.3                    # Poisson ratio   
SigmaY_0=200.0              # Elastic limit of virgin material  
h = 30000.0                 # Hardening parameter 
theta_star = 0.2            # Mixed hardening parameter
SigmaY_inf = 300            # Elastic limit at saturation
eta_k = math.sqrt(2/3) * h/SigmaY_0 # Non-linear kinematic parameter
viscoRelaxationTime = .8    # [s] = eta / h_i
eta = h*viscoRelaxationTime # Viscoplastic parameter [MPa.s]

if(IsoHardening != 0 and KinHardening != 0): # if mixed hardening
    h_i = theta_star * h
    h_k = (1 - theta_star) * h
elif(IsoHardening == 0): # if pure kinematic hardening
    h_i = 0
    h_k = h
else: # if KinHardening == 0
    h_i = h
    h_k = 0

materset = domain.getMaterialSet() 
if(KinHardening == 0):
    material1 = materset.define (1, EvpIsoHHypoMaterial) #Create material number 1 as Elasto-viscoplastic with Isotropic linear hardening 
else:
    material1 = materset.define (1, EvpMixtHHypoMaterial)
material1.put(MASS_DENSITY,    Density)   #Set Material parameters (see required parameters in the documentation)
material1.put(ELASTIC_MODULUS, Young)     
material1.put(POISSON_RATIO,   Nu)   
if(Visco == 0):
    material1.put(YIELD_NUM, IsoHardening)  #Number of the hardening law used
if(KinHardening != 0):
    material1.put(KH_NB, 1)
    material1.put(KH_NUM1, KinHardening + Kin_base) # Number of the kinematic hardening law
if(Visco != 0):
    material1.put(YIELD_NUM, 5) # poof, a magic number appeared :p

lawset = domain.getMaterialLawSet() 
# Reference pages in the doc:
#   http://metafor.ltas.ulg.ac.be/dokuwiki/doc/user/elements/volumes/isohard
#   http://metafor.ltas.ulg.ac.be/dokuwiki/doc/user/elements/volumes/kinehard
#   http://metafor.ltas.ulg.ac.be/dokuwiki/doc/user/elements/volumes/yield_stress

# No isotropic hardening for pure kinematic hardening
lawset0 = lawset.define(0, LinearIsotropicHardening)  #Create law number 1 as Linear Isotropic hardening law 
lawset0.put(IH_SIGEL,   SigmaY_0) #Set law parameters (see required parameters in the documentation)
lawset0.put(IH_H,       0)

# Linear isotropic hardening
lawset1 = lawset.define(1, LinearIsotropicHardening)  #Create law number 1 as Linear Isotropic hardening law 
lawset1.put(IH_SIGEL,   SigmaY_0) #Set law parameters (see required parameters in the documentation)
lawset1.put(IH_H,       h_i)

# Non-linear isotropic hardening (saturated law/Voce's law)
lawset2 = lawset.define(2, SaturatedIsotropicHardening)
lawset2.put(IH_SIGEL, SigmaY_0)
lawset2.put(IH_Q, SigmaY_inf - SigmaY_0)
lawset2.put(IH_KSI, h_i/(SigmaY_inf - SigmaY_0))

# Linear kinematic hardening
lawset3 = lawset.define(3, DruckerPragerKinematicHardening)
lawset3.put(KH_H, h_k)

# Non-linear kinematic hardening
lawset4 = lawset.define(4, ArmstrongFrederickKinematicHardening)
lawset4.put(KH_H, h_k)
lawset4.put(KH_B, eta_k)

# Viscoplastic law ¡TODO!
lawset5 = lawset.define(5, PerzynaYieldStress)
lawset5.put(IH_NUM, IsoHardening)
lawset5.put(PERZYNA_K, eta)
lawset5.put(PERZYNA_M, 1)
lawset5.put(PERZYNA_N, 0)


############################################################
# END OF DEFINITION OF THE MATERIALS AND MATERIAL LAWS     #
############################################################ 
      
#5.0 ELEMENTS
#===========================================

#5.1 Definition of element properties
#-----------------------------------------------------------
prp1 = ElementProperties (Volume3DElement)                     
prp1.put (MATERIAL, 1)                          # Number of the material used                                  
prp1.put (CAUCHYMECHVOLINTMETH,VES_CMVIM_STD)   


#5.2 Generating elements on the mesh
#------------------------------------------------------------
app = FieldApplicator(1)                                       
app.push(volumeset(1))                                           
app.addProperty(prp1)                                          
domain.getInteractionSet().add(app)                            


#6. BOUNDARY CONDITIONS
#============ 

loadingset = domain.getLoadingSet() 

if p['GeometryHypothesis']=="PLANESTRESS":
    loadingset.define(sideset(1),Field1D(TZ,RE),0.)                     
    loadingset.define(sideset(3),Field1D(TY,RE),0.)                     
    loadingset.define(sideset(6),Field1D(TX,RE),0.)                     
    
elif p['GeometryHypothesis']=="PLANESTRAIN":
    loadingset.define(sideset(1),Field1D(TZ,RE),0.)                     
    loadingset.define(sideset(2),Field1D(TZ,RE),0.) 
    loadingset.define(sideset(3),Field1D(TY,RE),0.)                     
    loadingset.define(sideset(6),Field1D(TX,RE),0.)
    ###################################################################
    # IMPLEMENT BOUNDARY CONDITION TO OBTAIN PLANE STRAIN STATE HERE  #
    ###################################################################
    # => what I've done *should* be ok
    

    
#7. LOADS
#=============
# 7.1 Definition of the loading function
#-------------------------------------------------

#LOAD:                                                              
Trac = 305.                       #Traction
Ncycle = 5                         #Number of cycles of loading/unloading
Tcycle = 4.                        #Duration of one cycle

uMax = 0.5                       #Max prescribed displacement 

fct = PieceWiseLinearFunction()
whichFunction = "visco2"
# whichFunction = "reverse"
# whichFunction = "visco1"
# whichFunction = "visco2"
if whichFunction == "normal":
    for i in range (0,Ncycle):
        fct.setData(i*Tcycle+0.,0.) #POINT n°1
        fct.setData(i*Tcycle+Tcycle/4.0,1.0)#POINT n°2
        fct.setData(i*Tcycle+Tcycle*2.0/4.0,0.0)#POINT n°3
        fct.setData(i*Tcycle+Tcycle*3.0/4.0,-1.0)#POINT n°4
        fct.setData(i*Tcycle+Tcycle*4.0/4.0,0.0)#POINT n°5    
elif whichFunction == "reverse": # t = -t(t)
    for i in range (0,Ncycle):
        fct.setData(i*Tcycle+0.,0.) #POINT n°1
        fct.setData(i*Tcycle+Tcycle/4.0,-1.0)#POINT n°2
        fct.setData(i*Tcycle+Tcycle*2.0/4.0,0.0)#POINT n°3
        fct.setData(i*Tcycle+Tcycle*3.0/4.0,1.0)#POINT n°4
        fct.setData(i*Tcycle+Tcycle*4.0/4.0,0.0)#POINT n°5    
elif whichFunction == "visco1": # kept at a non-zero value after one cycle
        staticLoadFraction = 1 # = staticLoad / Trac
        fct.setData(0.,0.) #POINT n°1
        fct.setData(Tcycle/4.0,1.0)#POINT n°2
        fct.setData(Tcycle*2.0/4.0,0.0)#POINT n°3
        fct.setData(Tcycle*3.0/4.0,-1.0)#POINT n°4
        fct.setData(Tcycle*4.0/4.0,0.0)#POINT n°5    
        fct.setData(Tcycle*5.0/4.0,staticLoadFraction)#POINT n°6    
        fct.setData(Tcycle*10.0,staticLoadFraction)#POINT n°7    
elif whichFunction == "visco2":
    # smoothen sawtooth: /¯\_   _
    #                        \_/
    RelaxFractionTime = 1/4
    for i in range (0,Ncycle):
        fct.setData(i*Tcycle*(1+4*RelaxFractionTime)+0.,0.) #POINT n°1
        fct.setData(i*Tcycle*(1+4*RelaxFractionTime)+Tcycle/4.,1.) #POINT n°2
        fct.setData(i*Tcycle*(1+4*RelaxFractionTime)+Tcycle*(1./4.+RelaxFractionTime),1.) #POINT n°3
        fct.setData(i*Tcycle*(1+4*RelaxFractionTime)+Tcycle*(2./4.+RelaxFractionTime),0.) #POINT n°4
        fct.setData(i*Tcycle*(1+4*RelaxFractionTime)+Tcycle*(2./4.+2*RelaxFractionTime),0.) #POINT n°5
        fct.setData(i*Tcycle*(1+4*RelaxFractionTime)+Tcycle*(3./4.+2*RelaxFractionTime),-1.) #POINT n°6
        fct.setData(i*Tcycle*(1+4*RelaxFractionTime)+Tcycle*(3./4.+3*RelaxFractionTime),-1.) #POINT n°7
        fct.setData(i*Tcycle*(1+4*RelaxFractionTime)+Tcycle*(1+3*RelaxFractionTime),0.) #POINT n°8
        fct.setData(i*Tcycle*(1+4*RelaxFractionTime)+Tcycle*(1+4*RelaxFractionTime),0.) #POINT n°9   

#########################################
# IMPLEMENT A DIFFERENT LOADING FCT HERE#
#########################################
if prescrDisp == 1:
    Trac = 0.
    loadingset.define(sideset(4), Field1D(TX,RE), uMax, fct, INCREMENTAL_LOAD)
    
prp2 = ElementProperties (Traction3DElement)                    
prp2.put(PRESSURE,  Trac)                             
prp2.depend (PRESSURE, fct, Field1D(TM,RE)) # To apply your new function, you can put it instead of "fct" here

    
#7.3 Generating the pressure element on the mesh
#---------------------------------------------------------------------
trac = LoadingInteraction(2)                                    
trac.push(sideset(4))                                           
trac.addProperty(prp2)                                          
domain.getInteractionSet().add(trac)                         

#8. Integration Scheme
#========================

#8.1 Gestion des pas de temps
#-----------------------------
tsm = metafor.getTimeStepManager()                             
tsm.setInitialTime(0.0,   p['dT'])                                  
tsm.setNextTime(Ncycle*Tcycle, int(Ncycle*Tcycle),  p['dT'])                                    
                                                                
#9. Archiving
#============
node_id = 7

valuesmanager = metafor.getValuesManager()                                                  #Access Values Manager

valuesmanager.add(1, MiscValueExtractor(metafor,EXT_T),'time')    

valuesmanager.add(15, IFNodalValueExtractor(pointset(node_id), IF_SIG_XY),'Sigma_XY' )
valuesmanager.add(16, IFNodalValueExtractor(pointset(node_id), IF_SIG_XZ),'Sigma_XZ' )
valuesmanager.add(17, IFNodalValueExtractor(pointset(node_id), IF_SIG_YZ),'Sigma_YZ' )                          #Archive the time(EXT_T) in a "time.ascii" file

#Stress
valuesmanager.add(2, IFNodalValueExtractor(pointset(node_id), IF_SIG_XX),'Sigma_XX' )
valuesmanager.add(3, IFNodalValueExtractor(pointset(node_id), IF_SIG_YY),'Sigma_YY' )
valuesmanager.add(4, IFNodalValueExtractor(pointset(node_id), IF_SIG_ZZ),'Sigma_ZZ' )
valuesmanager.add(5, IFNodalValueExtractor(pointset(node_id), IF_EVMS),'SigmaVM' )
valuesmanager.add(6, IFNodalValueExtractor(pointset(node_id), IF_YIELD_STRESS),'Sigma_Yield' )

#Strain
valuesmanager.add(7, IFNodalValueExtractor(pointset(node_id), IF_EPL),'EPL' )
valuesmanager.add(8, IFNodalValueExtractor(pointset(node_id), IF_NAT_STRAIN_XX),'E_XX' )
valuesmanager.add(9, IFNodalValueExtractor(pointset(node_id), IF_NAT_STRAIN_YY),'E_YY' )
valuesmanager.add(10, IFNodalValueExtractor(pointset(node_id), IF_NAT_STRAIN_ZZ),'E_ZZ' )
valuesmanager.add(21, IFNodalValueExtractor(pointset(node_id), IF_NAT_STRAIN_XY),'E_XY' )
valuesmanager.add(22, IFNodalValueExtractor(pointset(node_id), IF_NAT_STRAIN_XZ),'E_XZ' )
valuesmanager.add(23, IFNodalValueExtractor(pointset(node_id), IF_NAT_STRAIN_YZ),'E_YZ' )
valuesmanager.add(24, IFNodalValueExtractor(pointset(node_id), IF_DEPL),'DEPL' )
#Backstress
valuesmanager.add(11, IFNodalValueExtractor(pointset(node_id), IF_ALP_XX),'A_XX' )
valuesmanager.add(12, IFNodalValueExtractor(pointset(node_id), IF_ALP_YY),'A_YY' )
valuesmanager.add(13, IFNodalValueExtractor(pointset(node_id), IF_ALP_ZZ),'A_ZZ' )
valuesmanager.add(18, IFNodalValueExtractor(pointset(node_id), IF_ALP_XY),'A_XY' )
valuesmanager.add(19, IFNodalValueExtractor(pointset(node_id), IF_ALP_XZ),'A_XZ' )
valuesmanager.add(20, IFNodalValueExtractor(pointset(node_id), IF_ALP_YZ),'A_YZ' )

#Hydrorpessure
valuesmanager.add(14, IFNodalValueExtractor(pointset(node_id), IF_P),'IF_P' )

#10. Visualisation of curves in real time (not necessary but useful)
#=====================================================

#Stress
dataCurveSX = VectorDataCurve(1, valuesmanager.getDataVector(1), valuesmanager.getDataVector(2),'Sigma_XX')
dataCurveSY = VectorDataCurve(2, valuesmanager.getDataVector(1), valuesmanager.getDataVector(3),'Sigma_YY')
dataCurveSZ = VectorDataCurve(3, valuesmanager.getDataVector(1), valuesmanager.getDataVector(4),'Sigma_ZZ')
dataCurveSVM = VectorDataCurve(4, valuesmanager.getDataVector(1), valuesmanager.getDataVector(5),'Sigma_VM')
dataCurveSYield = VectorDataCurve(5, valuesmanager.getDataVector(1), valuesmanager.getDataVector(6),'Sigma_Yield')

dataCurveSXY = VectorDataCurve(13, valuesmanager.getDataVector(1), valuesmanager.getDataVector(15),'Sigma_XY')
dataCurveSXZ = VectorDataCurve(14, valuesmanager.getDataVector(1), valuesmanager.getDataVector(16),'Sigma_XZ')
dataCurveSYZ = VectorDataCurve(15, valuesmanager.getDataVector(1), valuesmanager.getDataVector(17),'Sigma_YZ')

dataCurveSet2 = DataCurveSet()
dataCurveSet2.add(dataCurveSX)
dataCurveSet2.add(dataCurveSY)
dataCurveSet2.add(dataCurveSZ)
dataCurveSet2.add(dataCurveSVM)
dataCurveSet2.add(dataCurveSYield)


# dataCurveSet2.add(dataCurveSXY)
# dataCurveSet2.add(dataCurveSXZ)
# dataCurveSet2.add(dataCurveSYZ)


winc2 = VizWin()
winc2.add(dataCurveSet2)
metafor.addObserver(winc2)

#Strain
dataCurveDEPL = VectorDataCurve(6, valuesmanager.getDataVector(1), valuesmanager.getDataVector(7),'E_PL')
dataCurveDX = VectorDataCurve(7, valuesmanager.getDataVector(1), valuesmanager.getDataVector(8),'E_XX')
dataCurveDY = VectorDataCurve(8, valuesmanager.getDataVector(1), valuesmanager.getDataVector(9),'E_YY')
dataCurveDZ = VectorDataCurve(9, valuesmanager.getDataVector(1), valuesmanager.getDataVector(10),'E_ZZ')
dataCurveDXY = VectorDataCurve(19, valuesmanager.getDataVector(1), valuesmanager.getDataVector(21),'E_XY')
dataCurveDXZ = VectorDataCurve(20, valuesmanager.getDataVector(1), valuesmanager.getDataVector(22),'E_XZ')
dataCurveDYZ = VectorDataCurve(21, valuesmanager.getDataVector(1), valuesmanager.getDataVector(23),'E_YZ')
dataCurveDDEPL = VectorDataCurve(22, valuesmanager.getDataVector(1), valuesmanager.getDataVector(24),'DE_PL')

dataCurveSet3 = DataCurveSet()
dataCurveSet3.add(dataCurveDX)
dataCurveSet3.add(dataCurveDY)
dataCurveSet3.add(dataCurveDZ)
dataCurveSet3.add(dataCurveDEPL)
dataCurveSet3.add(dataCurveDDEPL)
winc3 = VizWin()
winc3.add(dataCurveSet3)
metafor.addObserver(winc3)

#Backstress
dataCurveAX = VectorDataCurve(10, valuesmanager.getDataVector(1), valuesmanager.getDataVector(11),'A_XX')
dataCurveAY = VectorDataCurve(11, valuesmanager.getDataVector(1), valuesmanager.getDataVector(12),'A_YY')
dataCurveAZ = VectorDataCurve(12, valuesmanager.getDataVector(1), valuesmanager.getDataVector(13),'A_ZZ')
dataCurveAXY = VectorDataCurve(16, valuesmanager.getDataVector(1), valuesmanager.getDataVector(18),'A_XY')
dataCurveAXZ = VectorDataCurve(17, valuesmanager.getDataVector(1), valuesmanager.getDataVector(19),'A_XZ')
dataCurveAYZ = VectorDataCurve(18, valuesmanager.getDataVector(1), valuesmanager.getDataVector(20),'A_YZ')


dataCurveSet4 = DataCurveSet()
dataCurveSet4.add(dataCurveAX)
dataCurveSet4.add(dataCurveAY)
dataCurveSet4.add(dataCurveAZ)
# dataCurveSet4.add(dataCurveAXY)
# dataCurveSet4.add(dataCurveAXZ)
# dataCurveSet4.add(dataCurveAYZ)
winc4 = VizWin()
winc4.add(dataCurveSet4)
metafor.addObserver(winc4)

# Hydropressure
dataCurveP = VectorDataCurve(13, valuesmanager.getDataVector(1), valuesmanager.getDataVector(14),'IF_P')
dataCurveSet5 = DataCurveSet()
dataCurveSet5.add(dataCurveP)
winc5 = VizWin()
winc5.add(dataCurveSet5)
metafor.addObserver(winc5)

