<cfscript>
    recipeDetail = args.recipeDetail ?: QueryNew("");
    var steps = []
    for (item in listToArray(recipeDetail.steps, ",")) { 
        steps.append(item)
    } 
</cfscript>
<cfoutput>
    
      <div id="session-carousel" class="carousel slide" data-ride="carousel">
    
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <cfloop index="i" from="1" to="#arrayLen(steps)#">
                <div class="item <cfif i EQ 1>active</cfif>" style="height:300px">
                    <p>Step #i# of #arrayLen(steps)#</p>
                    <p>#steps[i]#</p>
                </div>
            </cfloop>
        </div>
      
        <!-- Controls -->
        <a class="left carousel-control" href="##session-carousel" role="button" data-slide="prev">
          <span>Previous</span>
        </a>
        <a class="right carousel-control" href="##session-carousel" role="button" data-slide="next">
          <span>Next</span>
        </a>
      </div>
   
</cfoutput>