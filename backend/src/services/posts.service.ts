import * as PostsRepository from '../repositories/posts.repository';

const getAllPosts = async () => {
    return await PostsRepository.findAll();
};

const getPost = async (postId: string) => {
    return await PostsRepository.findOne(postId);
}

const deletePost = async (postID: string) => {
    return await PostsRepository.deletePost(postID);
}

const getPostsByFilters = async (filterParams: {}) => {
    return await PostsRepository.findMany(filterParams);
}

export  {getAllPosts, getPost, deletePost,getPostsByFilters};