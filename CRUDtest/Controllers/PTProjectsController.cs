using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using CRUDtest.Models;
using System.Web.Http.Cors;


namespace CRUDtest.Controllers
{
    [EnableCors(origins: "http://localhost:50184", headers: "*", methods: "*")]
    public class PTProjectsController : ApiController
    {
        // GET: api/PTProjects
        [Route("api/PTProjects")]
        public HttpResponseMessage Get()
        {
            var projects = ProjectsRepository.GetAllProjects();
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, projects);
            return response;
        }

        // GET: api/PTProjects/5
        [Route("api/PTProjects/{id?}")]
        public HttpResponseMessage Get(int id)
        {
            var projects = ProjectsRepository.GetProject(id);
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, projects);
            return response;
        }
        [Route("api/PTProjects/{name:alpha}")]
        public HttpResponseMessage Get(string name)
        {
            var pojects = ProjectsRepository.SearchProjcetByName(name);
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, pojects);
            return response;
        }

        // POST: api/PTProjects
        [Route("api/PTProjects")]
        public HttpResponseMessage Post(Project p)
        {
            var projects = ProjectsRepository.InsertProject(p);
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, projects);
            return response;
        }

        // PUT: api/PTProjects/5
        [Route("api/PTProjects")]
        public HttpResponseMessage Put(Project p)
        {
            var projects = ProjectsRepository.UpdateProjcet(p);
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, projects);
            return response;
        }

        // DELETE: api/PTProjects/5
        [Route("api/PTProjects")]

        public HttpResponseMessage Delete(Project p)
        {
            var projects = ProjectsRepository.DeleteProject(p);
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, projects);
            return response;
        }

    }
}
