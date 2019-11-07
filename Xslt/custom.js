var siteRoot ="";
$(document).ready(function () {
  setTimeout(function(){
    $(".btn-apply").click(function () {
        var link=$(this).attr("data-applyurl");
        console.log(link);
        $("#ungtuyen").attr("src", link);
    });
  }, 1000);
  /*************************************************************************************************************/
    /* BEGIN SEARCH
    /*************************************************************************************************************/
  //Search button
  $(".productsearchbox input[type='submit'],.productsearchbox button").click(function () {
    var container = $(this).parent();
    if ($(container).find(".suggestsearch ul li.selected").length) {
      var n = $(container).find(".suggestsearch ul li.selected").eq(0).children("a").attr("href");
      window.location = n;

      return false;
    }

    if ($(container).find("input[type='text']").val() == '') {
      $(container).find("input[type='text']").focus();
      return false;
    }
  });

  //Search textbox
  $(".productsearchbox input[type='text']").keyup(function (n) {
    //        SuggestSearch(this, n);
    CallSuggest(this);
  });

  //    $(".productsearchbox input[type='text']").keydown(function () {
  //        CheckTimer();
  //    });

  var beginTime = 0, endTime = 0;
  function CheckTimer() {
    var n = new Date;
    beginTime == 0 && endTime == 0 && (beginTime = n.getTime());
    return
  }

  function SuggestSearch(obj, n) {
    var i = new Date, t;
    var suggestBoxItems = $(obj).parent().find(".suggestsearch ul");

    if (endTime = i.getTime(), beginTime = endTime, n.which == 40) {
      //$(".productsearchbox .suggestsearch ul li.selected").length == 0 ? $(".productsearchbox .suggestsearch ul li:first").addClass("selected") : (t = $(".productsearchbox .suggestsearch ul li.selected").next(), t.hasClass("li-group") && (t = t.next()), $(".productsearchbox .suggestsearch ul li.selected").removeClass("selected"), t.addClass("selected"));
      $(suggestBoxItems).find(".selected").length == 0 ? $(suggestBoxItems).find("li").first().addClass("selected") : (t = $(suggestBoxItems).find(".selected").next(), t.hasClass("li-group") && (t = t.next()), $(suggestBoxItems).find(".selected").removeClass("selected"), t.addClass("selected"));
      return
    }
    if (n.which == 38) {
      //$(".productsearchbox .suggestsearch ul li.selected").length == 0 ? $(".productsearchbox .suggestsearch ul li:last").addClass("selected") : (t = $(".productsearchbox .suggestsearch ul li.selected").prev(), t.hasClass("li-group") && (t = t.prev()), $(".productsearchbox .suggestsearch ul li.selected").removeClass("selected"), t.addClass("selected"));
      $(suggestBoxItems).find(".selected").length == 0 ? $(suggestBoxItems).find("li").last().addClass("selected") : (t = $(suggestBoxItems).find(".selected").prev(), t.hasClass("li-group") && (t = t.prev()), $(suggestBoxItems).find(".selected").removeClass("selected"), t.addClass("selected"));
      return
    }

    SetTimeer(obj, 1)
  }

  function SetTimeer(obj, n) {
    setTimeout(function () {
      var i = new Date,
        t = i.getTime();
      if (beginTime == endTime) {
        if (t - endTime < 750 && t - endTime >= 0) {
          SetTimeer(obj, n);
          return
        }
        if (t - endTime >= 750) {
          CallSuggest(obj);
          return
        }
      } else return
    }, n)
  }

  function CallSuggest(obj) {
    var container = $(obj).parent();
    if (!$(container).find(".suggestsearch").length)
      $(container).append("<div class='suggestsearch'></div>");

    var suggestBox = $(container).find(".suggestsearch");

    var t = $(obj).val().replace(/:|;|!|@@|#|\$|%|\^|&|\*|'|"|>|<|,|\.|\?|\/|`|~|\+|=|_|\(|\)|{|}|\[|\]|\\|\|/gi, ""),
      n = t.trim().toLowerCase();
    if (n.length < 2) {
      $(suggestBox).hide();
      return
    }
    n.length >= 2 && ($(obj).addClass("loading"), $.ajax({
      url: siteRoot + "/Product/Services/SuggestSearch.ashx",
      type: "GET",
      dataType: "html",
      data: {
        q: n
      },
      cache: !0,
      success: function (data) {
        $(obj).removeClass("loading");
        (data == "" || data == " ") ? $(suggestBox).hide() : ($(suggestBox).html(data).show())
      }
    }))
  }

  var obp = $(".searchresults .productcount");
  if ($(obp).length) {
    $.get(siteRoot + "/Product/Services/SearchCountResult.ashx?q=" + $(obp).attr("keyword"), function (data) {
      $(obp).text(" (" + data + ")");
    });
  }

  var obn = $(".searchresults .newscount");
  if ($(obn).length) {
    $.get(siteRoot + "/News/Services/SearchCountResult.ashx?q=" + $(obn).attr("keyword"), function (data) {
      $(obn).text(" (" + data + ")");
    });
  }

  /*************************************************************************************************************/
    /* END SEARCH
    /*************************************************************************************************************/

});


