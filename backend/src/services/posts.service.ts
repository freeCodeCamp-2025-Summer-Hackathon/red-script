import * as PostsRepository from '../repositories/posts.repository';

const getAllPosts = async () => {

    return await PostsRepository.findAll();
};

const deletePost = async (postID: string) => {
    return await PostsRepository.deletePost(postID);
}

export  {getAllPosts, deletePost};