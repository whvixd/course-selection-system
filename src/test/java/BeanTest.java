import com.action.TeacherAction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BeanTest {

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        TeacherAction student = (TeacherAction) context.getBean("teacherAction");
//        student.setTeacher_tnum("sklaoshi001");
//        student.setTeacher_tpwd("123456");
        String result = student.teacherlogin();

        System.out.println(result);
    }
}
