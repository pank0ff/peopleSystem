<#import "parts/common.ftl" as c>

<@c.page>
    List of users
    <table>
        <thead>
        <tr>
            <th></th>
            <th>Id</th>
            <th>Name</th>
            <th>Role</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr><form action="/user" method="post">
                <td>
                        <input type="hidden" name="username" value="${user.username}">
                        <#list user.roles as role>
                            <div>
                                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}></label>
                            </div>
                        </#list>
                        <input type="hidden" value="${user.id}" name="userId">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                       </td>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id}">edit</a></td>
                    <td><button type="submit">Save</button>
                </form></td>

            </tr>
        </#list>
        </tbody>
    </table>

</@c.page>