<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BoxShare</title>
  <script src="https://cdn.tailwindcss.com"></script>

</head>
<body class="font-sans flex flex-col h-screen">

  <!-- ----------------------------------------------------------------------- -->
  <!--                                 !navbar                                 -->
  <!-- ----------------------------------------------------------------------- -->

  <nav class="bg-gradient-to-r from-violet-700 to-purple-400 text-white flex-shrink-0 flex items-center pl-10 pr-10 min-h-[12vh] h-auto">
    <img src="./share_box_logo.png" alt="Local Image" class="w-10 h-10 object-cover">
    <div class="w-5"></div>
    <p class="text-white text-[30px] font-bold font-['Inter']">BoxShare</p>
  </nav>

  <!-- ----------------------------------------------------------------------- -->
  <!--                                  !body                                  -->
  <!-- ----------------------------------------------------------------------- -->

  <div class="flex-grow p-4">
    <!-- Body content goes here -->
    <div class="Title  absolute text-pink-600 text-[18px] font-extrabold font-['Inter'] p-8 mb-[30px] items-center">Share you files temporarily
      to anyone</div>

    <!-- ----------------------------------------------------------------------- -->
    <!--                                   //@                                   -->
    <!-- ----------------------------------------------------------------------- -->

 <div class="SearchBox w-[370px] h-[407px] left-[907px] top-[148px] absolute">
 
    <form action="SearchBoxServlet" method="post">
        <input type="text" name="boxId" class="SearchBodyBg w-[310px] h-12 left-0 top-0 top-[359px] absolute bg-stone-50 rounded-[9px] border border-zinc-700 px-4 text-neutral-400 text-xs font-normal font-['Inter']"
            placeholder="Enter code to view items in box">
        <button type="submit" class="SearchButton w-[50px] h-12 left-[320px] top-[359px] absolute bg-gradient-to-br from-violet-700 to-fuchsia-400 rounded-[9px] border border-neutral-200 flex items-center justify-center">
            <img src="./right_icon.png" alt="Your Icon" class="w-12 h-12 p-4 object-cover">
        </button>
    </form>
    <img class="Boxes w-[258px] h-[204px] left-[56px] top-[133px] absolute" src="./filled_boxes.png" />
    <div class="SearchABoxView left-[40px] top-[63px] absolute text-purple-950 text-2xl font-bold font-['Inter']">Search a Box & View</div>
    
    
      <!-- Display error message if any -->
  <div class="text-red-500 mt-2 left-[5px] top-[400px] absolute">
    <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
  </div>
</div>




    <!-- ----------------------------------------------------------------------- -->
    <!--                                   //@                                   -->
    <!-- ----------------------------------------------------------------------- -->

    <div class="VerticalDivider w-[312.02px] left-[756.97px] top-[243px] absolute origin-top-left rotate-[90.44deg] border border-stone-300"></div>

    <!-- ----------------------------------------------------------------------- -->
    <!--                            //@ left fill box                            -->
    <!-- ----------------------------------------------------------------------- -->

    <div class="FillBox w-[392px] h-[308px] left-[49px] top-[148px] absolute">
      <div class="DisplayCodeBox w-[278px] h-12 left-0 top-[360px] absolute">
        <div class="Rectangle2 w-[278px] h-12 left-0 top-0 absolute bg-stone-50 rounded-[9px] "></div>
        <div class="DisplayCodeText left-[40px] top-[16px] absolute text-neutral-400 text-xs font-normal font-['Inter']">Add items in box to get the sharing code</div>
      </div>
      
      <form action="CreateBoxServlet" method="post">
      <button class="AddItemsButton w-[198px] h-12 left-[294px] top-[360px] absolute bg-gradient-to-br from-violet-700 to-fuchsia-400 rounded-[9px] border border-neutral-200 flex items-center justify-center">
        <img src="./add_icon.png" alt="Your Icon" class="w-12 h-12 p-4 object-cover">
        <div class="AddItemsInBox text-white text-[15px] font-bold font-['Inter']">Add items in box</div>
      </button>
      </form>
      
      
      <div class="FillABoxShare left-[83px] top-[63px] absolute text-purple-950 text-2xl font-bold font-['Inter']">Fill a Box & Share</div>
      <img class="Emptybox w-[300px] h-[300px] left-[70px] top-[103px] absolute" src="./empty_box.png" />
    </div>

  </div>

  <!-- ----------------------------------------------------------------------- -->
  <!--                                ! footer                                 -->
  <!-- ----------------------------------------------------------------------- -->

  <footer class="bg-gradient-to-l from-violet-900 to-slate-900 text-white text-[10px] p-4 flex-shrink-0" style="height: 10vh;">
    JAVA mini project, using java, jsp, servelet.
  </footer>

</body>

</html>