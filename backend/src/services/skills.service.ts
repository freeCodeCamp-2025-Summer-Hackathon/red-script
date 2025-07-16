import SkillsRepository from '../repositories/skills.repository';

const getAllSkills = async () => {
  return await SkillsRepository.findAll();
};

export default { getAllSkills };
