import PostsRepository from '../repositories/posts.repository';

const getAllPosts = async () => {

    return await PostsRepository.findAll();
};

export default {getAllPosts};