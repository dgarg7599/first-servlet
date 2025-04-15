# first-servlet
## User-login-page

---
1. 🔄 JSP Internally Kaise Kaam Karta Hai?

JSP file ultimately Java Servlet mein convert ho jaati hai.

Jab tu likhta hai:

        <%
        int a = 10;
        out.println("Value: " + a);
        %>
Tomcat isko convert karta hai kuch aise Java code mein:

        public void _jspService(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        JspWriter out = response.getWriter();
        int a = 10;
        out.println("Value: " + a);
        }

Toh basically, % ke andar jo likha hota hai — wo servlet ke service() method ke andar chala jaata hai.


2.     <% ... %> → Scriptlet Tag
    Java ka code likhne ke liye :

        <% int a = 10; %>


3.     <%= ... %> → Expression Tag
   Jab tu value print karna chahta hai directly browser pe:

        <%= "Hello " + name %>
    Ye behind the scenes convert hota hai:

        out.print("Hello " + name);


4.     <%@ ... %> → Directive Tag
   Yeh top pe hota hai — page settings ke liye, jaise:

        <%@ page language="java" contentType="text/html; charset=UTF-8" %>
        <%@ page import="java.util.*" %>


5.     <%! ... %> → Declaration Tag
   Yeh class-level variables ya methods declare karne ke liye hota hai:

        <%! int counter = 0; %>
        <%! public String getName() { return "Divyansh"; } %>

---------

6.  @WebServlet: Ye annotation use hota hai servlet ko define karne ke liye. Isme URL pattern bhi diya jata hai jo batata hai ki ye servlet kis URL par respond karegi.


7.  A Servlet is a Java class that handles HTTP requests and generates responses. It works on the server-side and is part of the Java EE (Enterprise Edition).


8.  User Authentication: 

        if("admin".equals(username) && "1234".equals(password)) {
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        response.sendRedirect("welcome.jsp");
        } else {
        response.getWriter().println("Invalid login. <a href='login.html'>Try Again!</a>");
        }

"admin".equals(username) && "1234".equals(password): 

Ye condition check karti hai agar user ka username "admin" aur password "1234" hai. Ye static validation hai. Agar username aur password match hote hain to user authenticated hai.

HttpSession: 

Ye session object hai jo server-side pe ek user ki session ko track karta hai. Agar login successful hai, to hum session mein username store karte hain.

request.getSession(): 

Isse hum session object lete hain. Agar session already exist karta hai to wo reuse hota hai, agar nahi hai to naya session create hota hai.

session.setAttribute("username", username): 

Session mein username store kar diya jata hai, taaki user ko identify kiya ja sake.

response.sendRedirect("welcome.jsp"): 

Agar login successful hai, to user ko welcome.jsp page pe redirect kar diya jata hai.

Agar username aur password match nahi karte, to ek error message dikha diya jata hai: Invalid login. Try Again!


9. Why HttpSession is Used?


HttpSession ka use hum tab karte hain jab hume user ke session ko maintain karna ho, jaise ki logged-in user ka information.

Jab user login karta hai, to server ko uska session yaad rakhna padta hai taki wo next page pe bhi logged-in state me dikhe.

HttpSession ko create karne se user ki specific information (jaise username) track hoti hai across multiple pages. Agar session expire ho jata hai, to user ko dobara login karne ke liye bola jata hai.


10. Session Management: 

The technique used to maintain state across multiple requests from the same user.

----

