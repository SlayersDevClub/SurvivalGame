using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Gamekit3D {
    public class BaseSMBDodge : SceneLinkedSMB<BaseEnemy> {
        protected Vector3 m_AttackPosition;

        public override void OnSLStateEnter(Animator animator, AnimatorStateInfo stateInfo, int layerIndex) {
            base.OnSLStateEnter(animator, stateInfo, layerIndex);

            m_MonoBehaviour.controller.SetFollowNavmeshAgent(false);

            //if (m_MonoBehaviour.attackAudio != null)
            //   m_MonoBehaviour.attackAudio.PlayRandomClip();
        }

        public override void OnSLStateExit(Animator animator, AnimatorStateInfo stateInfo, int layerIndex) {
            base.OnSLStateExit(animator, stateInfo, layerIndex);

            //if (m_MonoBehaviour.attackAudio != null)
            //   m_MonoBehaviour.attackAudio.audioSource.Stop();

            m_MonoBehaviour.controller.SetFollowNavmeshAgent(true);
        }
    }
}