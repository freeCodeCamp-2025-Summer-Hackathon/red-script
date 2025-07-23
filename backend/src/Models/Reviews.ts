import {Swaps} from './Swaps'
import {Users} from './Users'
import {Skills} from './Skills'

export type Reviews = {
    id: number,
    guid: string,
    rating: number,
    comment: string | null,
    createdOn: Date,
    swapId: number,
    reviewerId: number,
    revieweeId: number,
    skillId: number | null,
    swap: Swaps[],
    reviewer: Users,
    reviewee: Users,
    skill: Skills | null,
}