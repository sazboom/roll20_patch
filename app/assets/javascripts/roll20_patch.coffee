$('#tmpl_characterviewer').html(
    """
      <div class='dialog largedialog characterviewer' style='display: block;'>
        <div class="row-fluid header">
          <div class="span12">
            Show / Hide
            <a href=# class="btn" onclick="toggleAvatar()">Avatar</a>
            <a href=# class="btn" onclick="toggleContent()">Content</a>
            <a href=# class="btn" onclick="toggleAttributes()">Attributes</a>
            <a href=# class="btn" onclick="toggleAbilities()">Abilities</a>
            <a href=# class="btn" onclick="toggleMacroBarLinks()">Macro Bar Links</a>
          </div>
        </div>
        <div class='row-fluid container'>
          <div class='span5 left-column'>
            <div class='avatar'>
            <$ if(this.get("avatar") != "") { $>
            <img src="<$!this.get("avatar")$>" />
            <$ } $>
            </div>
            <div class='clear'></div>
            <$ if(this.currentPlayerControls()) { $>
            <div class='clear'></div>
            <div class='attributes'>
              <h3>Attributes</h3>
              <div class='header'>
                <div class='heading'>Name</div>
                <div class='heading'>Current</div>
                <div class='heading' style='padding-left: 15px;'>
                  Max
                  <small>Optional</small>
                </div>
                <div class='clear'></div>
              </div>
              <div class='body'></div>
              <div class='clear'></div>
            </div>
            <hr />
            <div class='clear'></div>
            <div class='abilities' data-characterid="<$!this.id$>">
            <h3>Abilities</h3>
            <div class='body'></div>
            <div class='clear'></div>
            </div>
            <div class='clear'></div>
            <$ } $>
          </div>
          <div class='span7 right-column'>
            <div class='content redactor_editor'><$=d20.utils.handleHTMLOutput(this.get("bio") + "")$></div>
            <div class='clear'></div>
            <hr />
            <div class='clear'></div>
            <$ if(window.is_gm) { $>
            <label>GM Notes (Only visible to GM)</label>
            <div class='content redactor_editor'><$=d20.utils.handleHTMLOutput(this.get("gmnotes") + "")$></div>
            <$ } $>
            <div class='clear'></div>
          </div>
        </div>
      </div>
  """
)

window.toggleAvatar = ->
  $('.ui-dialog .characterviewer .avatar').toggle()

window.toggleContent = ->
  if $('.ui-dialog .characterviewer').data('details-hidden') == true
    $('.ui-dialog .characterviewer .container .right-column').show()
    $('.ui-dialog .characterviewer').data('details-hidden', false)  
  else
    $('.ui-dialog .characterviewer .container .right-column').hide()
    $('.ui-dialog .characterviewer').data('details-hidden', true)  
  
  

window.toggleAttributes = ->
  $('.ui-dialog .characterviewer .attributes').toggle()

window.toggleAbilities = ->
  $('.ui-dialog .characterviewer .abilities').toggle()

window.toggleMacroBarLinks = ->
  $('.ui-dialog .characterviewer .abilities .bartoggle').toggle()
  $('.ui-dialog .characterviewer .abilities .abil').css('padding-top','5px').css('padding-left','5px');
  $('.ui-dialog .characterviewer .abilities .abil:odd').css('background','#eee');
