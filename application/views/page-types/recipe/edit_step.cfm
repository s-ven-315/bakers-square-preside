<cfscript>
    event.include("js-modalEdit");
    var steps = []
    for (item in listToArray(args.recipeDetail.steps, ";")) { 
        steps.append(item)
    } 
</cfscript>
<cfset cfSteps=#args.recipeDetail.steps?:""#>
<cfoutput>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="##editStepModal">
        Edit Step
    </button>
    <div class="modal fade" id="editStepModal" tabindex="-1" role="dialog" aria-labelledby="editStepModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="editStepModalLabel">Recipe Steps</h5>
            </div>
            <div class="modal-body">
                <div class="step-list">
                    <ol class="step-list-ol list-group">
                        <cfloop index="i" from="1" to="#arrayLen(steps)#">
                            <div>
                                <button class="delete-listitem">Delete</button>
                                <li class="list-group-item">#steps[i]# </li>
                            </div>
                        </cfloop>
                    </ol>
                </div>
            </div>
            <form id="edit-step-form" action="#event.buildLink(linkTo="page-types.recipe.step")#" method="POST">
                <div class="modal-body">
                        <div class="form-group">
                          <input type="hidden" value=#event.getCurrentPageId()# name="id">
                          <input type="hidden" name="steps" class="step-submit">
                          <input class="step-input" type="text" placeholder="Add Step">
                          <button type="button" class="btn btn-primary add-more">Add</button>
                        </div>
                    </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary submit-btn">Save</button>
                    <button type="button" class="btn btn-secondary reset-btn" data-dismiss="modal">Cancel</button>
                </div>
            </form>
          </div>
        </div>
    </div>
    <script type="text/javascript" language="JavaScript">
        var #ToScript(cfSteps, "jsSteps")#;
        let addBtn = document.querySelector('.add-more');
        var str = jsSteps;
        addBtn.addEventListener('click', function(){
            let input = document.querySelector('.step-input').value;
            let stepOL = document.querySelector(".step-list-ol");
            let div = document.createElement("div")
            stepOL.appendChild(div)
            let btn = document.createElement("button")
            btn.innerHTML = "Delete";
            btn.className="delete-listitem"
            div.appendChild(btn);
            let node = document.createElement("li");
            node.className="list-group-item";
            node.innerHTML = input;
            div.appendChild(node);
            document.querySelector('.step-input').value = "" ;
            str += ';' + input;
            let submitThis = document.querySelector('.step-submit').value = str;
        })

        let resetBtn = document.querySelector('.reset-btn');
        resetBtn.addEventListener('click', function(){
            window.location.reload()
        })

        let submitBtn = document.querySelector('.submit-btn');
        submitBtn.addEventListener('click', function(){
            document.querySelector('.step-submit').value = str
        })
    </script>
</cfoutput>
<cfscript>
    event.include("js-modalEdit");
</cfscript>
