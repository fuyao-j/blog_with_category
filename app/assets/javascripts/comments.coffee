# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
App.cable.subscriptions.create { channel: "CommentsChannel", id: document.querySelector('head').dataset.visitId, type: document.querySelector('head').dataset.visitType},
  received: (data) ->
    @appendLine(data)

  appendLine: (data) ->
    html = @createLine(data)
    document.getElementById('comments').insertAdjacentHTML('beforeend', html)

  createLine: (data) ->
    """
    <div class="comment-line">
      <span class="author">Author name: #{data["author"]}</span>
      <span class="content">Comment: #{data["content"]}</span>
    </div>
    """