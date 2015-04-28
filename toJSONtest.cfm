<cfset toJSON = createObject("component", "toJSON")>

<!--- List to JSON --->
<cfset list = "apple,orange,pear,banana">
<cfset JSONList = toJSON.listToJSON(list,"fruits")>
List:<br />
<cfdump var="#JSONList#"><br />

<!--- Array to JSON --->
<cfset array = arrayNew(1)>
<cfset array[1] = "apple">
<cfset array[2] = "orange">
<cfset array[3] = "pear">
<cfset array[4] = "banana">
<cfset JSONArray = toJSON.arrayToJSON(array, "fruits")>
Array:<br />
<cfdump var="#JSONArray#"><br />

<!--- Query to JSON --->
<cfset q = queryNew("id,fruit,calories,color,date")>

<cfset queryAddRow(q)>
<cfset querySetCell(q, "id", 1)>
<cfset querySetCell(q, "fruit", "apple")>
<cfset querySetCell(q, "calories", "200")>
<cfset querySetCell(q, "color", "red")>
<cfset querySetCell(q, "date", dateAdd("d", q.recordCount, now()))>
<cfset queryAddRow(q)>
<cfset querySetCell(q, "id", 2)>
<cfset querySetCell(q, "fruit", "orange")>
<cfset querySetCell(q, "calories", "220")>
<cfset querySetCell(q, "color", "orange")>
<cfset querySetCell(q, "date", dateAdd("d", q.recordCount, now()))>

<cfset queryAddRow(q)>
<cfset querySetCell(q, "id", 3)>
<cfset querySetCell(q, "fruit", "pear")>
<cfset querySetCell(q, "calories", "500")>
<cfset querySetCell(q, "color", "yellowish")>
<cfset querySetCell(q, "date", dateAdd("d", q.recordCount, now()))>

<cfset queryAddRow(q)>
<cfset querySetCell(q, "id", 4)>
<cfset querySetCell(q, "fruit", "banana")>
<cfset querySetCell(q, "calories", "90")>
<cfset querySetCell(q, "color", "yellow or ""RED""")>
<!---
<cfset querySetCell(q, "date", dateAdd("d", q.recordCount, now()))>
--->
<cfset querySetCell(q, "date", "April 2, 2009")>
<cfset JSONQuery = toJSON.queryToJSON(q, "fruits","date,color")><br />

<cfoutput>
Date:<br />
#q.date[2]#<br /><br />

Query:<br />
#htmlcodeformat(JSONquery)#<br />
</cfoutput>
<cfdump var="#JSONQuery#"><br />

<!--- Struct to JSON --->
<cfset s = structNew()>
<cfset s.id = 9>
<cfset s.name = "Raymond Camden">
<cfset s.age = 33>

<cfset JSONStruct = toJSON.structToJSON(s, "people")>
Struct:<br />
<cfdump var="#JSONStruct#"><br />