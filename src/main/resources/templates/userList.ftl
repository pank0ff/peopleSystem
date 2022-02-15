<#import "parts/common.ftl" as c>

<@c.page>
    List of users
    <a href="/login">logout</a>
    <table>
        <thead>
        <tr>
            <th></th>
            <th>Id</th>
            <th>Name</th>
            <th>Role</th>
            <th>Email</th>
            <th>Reg date</th>
            <th>Last conn</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <form action="/user" method="post">
                    <td>
                        <input type="hidden" name="username" value="${user.username}">
                        <#list user.roles as role>
                            <div>
                                <label><input type="checkbox"
                                              name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}></label>
                            </div>
                        </#list>
                        <input type="hidden" value="${user.id}" name="userId">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                    </td>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td>${user.email}</td>
                    <td>${user.dateOfRegistration}</td>
                    <td>${user.dateOfLastConnect}</td>
                    <td><a href="/user/${user.id}">edit</a></td>
                    <td>
                </form>
                </td>
                <td><form action="/user" method="post">
                        <input type="hidden" name="username" value="${user.username}">
                        <input type="hidden" value="${user.id}" name="userId">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit">Block</button></form></td>

            </tr>
        </#list>
        </tbody>
    </table>

</@c.page>