using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDtest.Models
{
    public class ProjectsRepository
    {
        private static ProjectTrackingDBEntities dataContext = new ProjectTrackingDBEntities();

        public static List<Project> GetAllProjects()
        {
            var query = from project in dataContext.Projects select project;
            return query.ToList();
        }

        public static List<Project> SearchProjcetByName(string projectName)
        {
            var query = from project in dataContext.Projects where project.ProjectName.Contains(projectName) select project;
            return query.ToList();
        }
        public static Project GetProject(int ProjectID)
        {
            var query = from project in dataContext.Projects where project.ProjectID == ProjectID select project;
            return query.SingleOrDefault();
        }

        public static List<Project> InsertProject(Project p)
        {
            dataContext.Projects.Add(p);
            dataContext.SaveChanges();
            return GetAllProjects();
        }

        public static List<Project> UpdateProjcet(Project p)
        {
            var pro = (from project in dataContext.Projects where project.ProjectID == p.ProjectID select project).SingleOrDefault();

            pro.ProjectID = p.ProjectID;
            pro.ProjectName = p.ProjectName;
            pro.StartDate = p.StartDate;
            pro.EndDate = p.EndDate;
            pro.ClientName = p.ClientName;
            dataContext.SaveChanges();
            return GetAllProjects();
        }

        public static List<Project> DeleteProject(Project p)
        {
            var pro = (from project in dataContext.Projects where project.ProjectID == p.ProjectID select project).SingleOrDefault();
            dataContext.Projects.Remove(pro);
            dataContext.SaveChanges();
            return GetAllProjects();
        }
    }
}
    
