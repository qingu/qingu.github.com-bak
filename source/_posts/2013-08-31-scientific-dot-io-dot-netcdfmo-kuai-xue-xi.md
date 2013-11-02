---
layout: post
title: "Scientific.IO.NetCDF模块学习.md"
date: 2013-08-31 08:34
comments: true
categories: [python,netcdf] 
---

**NetCDF简介**

NetCDF (Network Common Data Form)是由美国大学大气研究协会(UCAR)下的Unidata项目科学家针对科学数据的特点，提出的一种面向数组型数据、适于网络共享的数据描述和编码标准。已被国内外许多行业和组织采用，目前广泛应用于大气科学、水文、海洋学、环境模拟、地球物理等诸多领域。NetCDF数据具有自描述性(普通二进制数据需要有相关文档介绍数据格式，否则无法正确读出数据)，数据与硬件平台无关(不用考虑数据的端序)。 

目前采用NetCDF格式的资料主要为再分析资料、卫星资料、数值模式资料等。 

每个NetCDF文件具备如下所示的结构，其中包含维数、变量、属性和数据4个子域，属性又分为适用于整个文件的全局属性和适用于特定变量的局部属性。

 * dimensions(维)：一个维可以用来代表一个真实的物理空间、例如时间、纬度、经
度或者高度。一个NetCDF的维有一个名字和长度，维的长度必须是一个正整数。
 
 * variables(变量)：在NetCDF数据集中，变量是用来存放数据块的。NetCDF数据集里的变量一般都是数组变量。一个变量代表着具有相同的数据类型的数组的值。每个变量都有一个名字、一个数据类型和数组形状。

 * attributes(属性)：NetCDF的属性是用来对数据进行辅助说明，存放关于数据的数据，例如变量的单位。

 * data(数据)：NetCDF支持的数据类型是char、byte、short、int、float或者real、double。

*注：以上摘自气象家园hzwjy的常用气象格式的数据读取及可视化。*

<!--more-->

---

**引入netcdf的python接口**

```
	from Scientific.IO import NetCDF
	import numpy as np  #NetCDF变量数据使用numpy数组
```

---

**创建/打开一个netCDF文件**

在python中创建一个netCDF文件，只需要调用`NetCDFFile`构造器。这也是打开一个现有
的netCDF文件的方法。调用返回NetCDFFile类型文件对象，以后对netCDF文件所有操作都要通
过该对象进行。如果文件打开写访问（'w'或'a'），将可以写入任何数据，包括新维数、
变量及属性。

```
	NetCDFFile(filename, mode) 
		 filename - name of the netCDF file as a string 
		 mode - "r" - (read_only) 
                "w" - (read_write) 
                "a" - open existing file or create new one if it does not yet exist for write
```

例如：

```
	ncfile = NetCDFFile(filename,'w')
```

---

**关闭一个netCDF文件**

通过`close()`方法关闭NetCDFFile文件对象。当调用close()，所用修改了的数据写到磁
盘文件中。

```
	ncfile.close()
```

---

**创建一个netCDF维数**

NetCDF使用`dimensions`术语定义所有变量大小，所以在任何变量创建前必须先创建好所
用的维数。

```
	NetCDFFile.createDimension(dimName, size) 
			dimName  -  Python string - e.g. 'nLevels' 
		    size -  integer value 
```

例如：

```
	dimName = 'numLevels'
	size = 12
	ncfile.createDimension(dimName, size)
```

---

**获得netCDF文件所有维数名字**

`NetCDFFile.dimensions`返回{dimName：size,...}维数与大小的字典。通过获得维数的python字典类型中所有条目（键）从而得到所有维数名字。注意netCDF文
件所有维数名字将以python列表形式返回。这些名字是创建变量时所用的维数元组的元素
。

```
	NetCDFFile.dimensions.keys()
```

例如：

```
	allDimNames = ncfile.dimensions.keys()
```

---

**获得一个netCDF维的值**

通过`dimensions`字典获得一个netCDF维的值。注意由于某些原因，获得`UNLIMITED`维
的当前值用该方法不起作用。该情况下返回值为"None"。然而，总是可以通过
`shape`属性得到任何变量维的当前值。

```
	dimValue = NetCDFFile.dimensions['dimName'] 
		dimName - name of a netCDF dimension as a Python string 
```

例如：

```
	dimValue = ncfile.dimensions['numLevels']
```

---

**创建一个netCDF变量**

实际上netCDF文件中所有数据存储在一个netCDF变量中（除了全局属性）。这儿就是如何
用python创建一个netCDF变量。注意`NetCDFFile`对象必须创建时使用'w'或'a'模式。同
时注意调用该方法返回一个netCDF变量对象，后面访问变量数据和属性时要用到。

```
	NetCDFFile.createVariable(varName, datatype, dimensions) 
		varName  - name of the variable 
		datatype  -  type of the variable.  Most common types are: 
                    'f'  - float 
                    'd'  - double precision float 
                    'i' or 'l' - int or long 
                    'c' - character 
                    'b' - byte 
```

例如：

```
	tempDims = ('dim1','dim2',)
	netCDFVar = ncfile.createVariable('temp','f',tempDims)
```

---

**获得netCDF文件所有变量名字**

获得变量名字方法和获得维数名字类似。注意该方法返回NetCDFFile对象的variables字
典的所有键（即变量名字），返回类型为列表。

```
	NetCDFFile.variables.keys()
```

例如：

```
	varNames = file.variables.keys()
```

---

**创建一个netCDF全局属性**

创建一个netCDF全局属性稍微不同于创建维或变量。一个普通的python函数被调用代替专
门用于netCDF接口的函数。

```
	setattr(NetCDFFile, attributeName, attributeValue) 
		NetCDFFile - NetCDFFile object returned from the function NetCDFFile() 
		attribute name - a Python string  e.g., 'myGlobalAtt' 
		attributeValue - the value of the attribute 
```

例如：

```
	setattr(ncfile,'globalAtt','attValue')
```

---

**获得所有全局属性**

使用python函数`dir()`取回netCDF文件中定义的每个全局属性的名字。注意这个调用返
回一个python列表，包含当前定义的所有全局属性。由于python工作方式，该列表同时包
含NetCDFFile对象可用的函数名字，包括下面条目：
'close','createDimensions','createVariable','flush','sync'。*警告：如果你定义一个全局属性其名字匹配先去提到的条目，当尝试调用该名字的函数时产生错误。所以，不要命名全局属性与上面条目相同的名字*

```
	dir(NetCDFFile) 
		NetCDFFile is the NetCDFFile object created with the NetCDFFile constructor. 
```

例如：

```
	globalAttList = dir(ncfile)
```

---

**获得一个全局属性的值**

使用`getattr()`函数获得一个全局属性的值。该函数同样可用于变量属性。

```
	globalAttValue = getattr(file, globalAttName) 
		file - NetCDFFile object returned from the function NetCDFFile() 
		globalAttName  - name of the global attribute 
```

例如：

```
	globalAttValue = getattr(ncfile,'globalAttName')
```

---

**查询一个全局属性是否存在**

使用python中`hasattr()`函数查询一个全局属性是否存在。注意该函数返回一个boolean
值，一般用在一个”if“语句中。

```
	hasattr(NetCDFFile，globalAttName) 
		globalAttName  - name of the global attribute 
```

例如：

```
	attName = 'myGlobalAttName'
	if hasattr(ncfile,attName):
		print attName, "exists in this netCDF file"
```

---

**将所有数据flush到磁盘**

有时需要显式将所有netCDF文件修改flush到磁盘，可用`sync()`函数完成。

```
	NetCDFFile.sync()
```

---

---

**NetCDF变量操作**

本节描述可对NetCDFFile变量执行的操作，包括：写数据、读数据、获得变量的维、及创
建、定义和读变量属性。

---

**获得一个netCDF变量对象**

为了访问netCDF变量数据和属性，首先需要获得netCDF变量的python对象。通过访问
NetCDFFile变量字典完成。

```
	NetCDFFile.variables[varName]
		varName - name of the netCDF variable as a Python string 
```

例如：

```
	var = ncfile.variables['temp']
```

---

**获得一个netCDF变量的数据类型**

有时需要一个netCDF变量的数据类型。`typecode()`函数就是用于该目的。

```
	typecode = NetCDFVariable.typecode() 
		typecode = a character value that represents the type of the netCDF variable.
```

例如：

```
	typechar = var.typecode()
```

---

**获得一个netCDF变量的shape**

numpy有一个概念叫数组的shape，是定义netCDF变量大小的维数值的元组。可能获得一个
netCDF变量大小最简单的方法是获得其shape，以一个python元组形式返回。注意“shape”
是变量对象的一个属性，不是函数调用，所以不需要括号。

```
	varShape = NetCDFVariable.shape
```

例如：

```
	varShape = var.shape
```

---

**给一个netCDF变量赋值**

使用numpy接口给一个netCDF变量赋值。一般将相同shape的numpy数组赋值给
NetCDFVariable对象。*注意如果赋值语句右边数组shape不与netCDF变量相同，不会赋值*

```
	NetCDFVariable[:] = data
		data - a Numeric Python array of the same shape as the variable 
```

例如：

```
	data = numpy.zeros(var.shape)  
	var[:] = data    
```

另一种赋值方法是使用函数`assignValue`。同样的，`assignValue`调用中值必须和
netCDF变量shape相同。

```
	data = numpy.zeros(var.shape)   
	var.assignValue(data)      
```

---

**获得一个netCDF变量的值**

使用`getValue()`函数实现。注意值存放在numpy数组中。和赋值一样，有两种方法获得
一个netCDF变量的值。

```
	NumericArray = var.getValue() 
		NumericArray - a Numeric Python array object 
```

例如：

```
	data = var.getValue()
```

另一种方法是使用numpy语法。

```
	data = NetCDFVariable[:] 
		data - a Numeric Python array object just like the one above 
```

例如：

```
	data = var[:]
```

---

**获得一个netCDF变量的维名字**

获得一个netCDF变量的维名字方法和获得一个NetCDF文件的维名字一样。由于
"dimensions"是一个属性，不需要括号。

```
	dimNames = NetCDFVariable.dimensions 
```

例如：

```
	dimNames = var.dimensions
```

---

**创建一个netCDF变量属性**

通过python自带的`setattr()`函数创建netCDF变量的属性。注意函数
"getValue","assignValue","typecode"在python被当做属性，所以创建的变量属性名字
不要和这些函数名字冲突。

```
	setattr(NetCDFVariable, attName, attValue) 
		NetCDFVariable = a netCDFVariable object 
		attName - the name of the attribute 
		attValue - the value of the attribute 
```

例如：

```
	attName = "newAtt" 
	attValue = "newAttValue" 
	setattr(var, attName, attValue)
```

---

**获得一个netCDF变量属性值**

使用`getattr()`函数实现。

```
	attData = getattr(NetCDFVariable, attName) 
		attData - value of the attribute 
		NetCDFVariable = a netCDFVariable object 
		attName - the name of the attribute 
```

---

**获得所有变量属性列表**

获得一个netCDF变量整个属性列表和获得一个netCDF文件所有全局属性类似。`dir()`函
数返回属性名字列表。*警告：该列表总是包括元素："assignValue","getValue","typecode"*

```
	attList = dir(NetCDFVariable)
```

---

**代码实例**

```
#-*-coding:utf-8-*-
import numpy as np
from Scientific.IO import NetCDF

#创建NetCDF文件对象
ncfile = NetCDF.NetCDFFile(r'e:\test.nc','w')

#创建变量前，先创建维
ncfile.createDimension('longitude',360)
ncfile.createDimension('latitude',181)
ncfile.createDimension('levelist',37)
ncfile.createDimension('time',24)

#获得NetCDF文件所有维、某一维值
print ncfile.dimensions
print ncfile.dimensions['time']
print ncfile.dimensions.keys()

#创建变量
ncfile.createVariable('ps','d',('longitude','latitude','time',))
ncfile.createVariable('p','d',('longitude','latitude','levelist','time',))

#获得NetCDF变量及其值
print ncfile.variables
print ncfile.variables.keys()
print ncfile.variables['ps']

#创建全局属性
setattr(ncfile, 'Conventions', 'CF-1.0')
setattr(ncfile, 'history', '2013-8-23UTC')

#获得全局属性，及某一全局属性值
print dir(ncfile)
print getattr(ncfile, 'history')

#判断是否存在某一全局属性
if hasattr(ncfile, 'Conventions'):
    print 'Conventions exists in ncfile'

#显示将数据写入文件 
ncfile.sync()

#获得NetCDF变量对象
ps = ncfile.variables['ps']
p = ncfile.variables['p']

#获得变量的类型及shape
print ps.typecode()
print p.shape

#对与NetCDF变量相同shape的临时数组赋值
data1 = np.zeros(ps.shape)
data2 = np.ones(p.shape)

#对NetCDF变量赋值，两种方法
ps[:] = data1
p.assignValue(data2)

#获得NetCDF变量值，两种方法
psValue = ps[:]
pValue = p.getValue()

#创建NetCDF变量的局部属性
setattr(ps, 'long_name', 'pressure of surface')
setattr(p, 'units', 'hPa')

#获得某一变量属性的值
print getattr(ps, 'long_name')
#获得变量的所有属性
print dir(ps)

#关闭NetCDF文件对象
ncfile.close()
```

---

**总结：**

本文介绍了NetCDF的python接口Scientific.IO.NetCDF模块。模块主要有两个操作对象：
NetCDFFile和NetCDFFile.variables[varName]。通过对象的方法实现创建、获得对应维
数、变量名称和值。使用python自带的dir()、setattr()等函数对变量属性和全局属性操
作。


**参考文章**

1. [http://gfesuite.noaa.gov/developer/netCDFPythonInterface.html][1]

[1]: http://gfesuite.noaa.gov/developer/netCDFPythonInterface.html "http://gfesuite.noaa.gov/developer/netCDFPythonInterface.html"


	




	

	   








