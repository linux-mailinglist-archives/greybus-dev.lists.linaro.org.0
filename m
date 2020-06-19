Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE3F201A6D
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2020 20:35:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3ACB6665BF
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jun 2020 18:35:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2D10C665DA; Fri, 19 Jun 2020 18:35:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 28327665C3;
	Fri, 19 Jun 2020 18:33:09 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DBE906089D
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 18:05:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C16E0665B6; Fri, 19 Jun 2020 18:05:58 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by lists.linaro.org (Postfix) with ESMTPS id D6D4C6089D
 for <greybus-dev@lists.linaro.org>; Fri, 19 Jun 2020 18:05:53 +0000 (UTC)
IronPort-SDR: ph78ZjFm/vd1BPzfLubjX2p2bHOXZwa65TgY5k/X3uzlt+hQ3KXoP3LhWObqpO2ap+LyLBGYC4
 RhmWP94S6TXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="130413289"
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; 
 d="gz'50?scan'50,208,50";a="130413289"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 11:05:52 -0700
IronPort-SDR: LO8bz3N19qFzfFF5xHZh8r/RNDehDnFMHKOn72EPVcR6wQUOnmXlcMtOJkfABL0flvjqQEliXj
 gABPFfRBRKQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; 
 d="gz'50?scan'50,208,50";a="421941659"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 19 Jun 2020 11:05:48 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jmLOd-000080-GW; Fri, 19 Jun 2020 18:05:47 +0000
Date: Sat, 20 Jun 2020 02:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>
Message-ID: <202006200150.mNVj1Duq%lkp@intel.com>
References: <e9aaa09c6688aa5ed8bddf51f5cd402bb8cf39b3.1592537217.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <e9aaa09c6688aa5ed8bddf51f5cd402bb8cf39b3.1592537217.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, kbuild-all@lists.01.org,
 Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH v3 6/6] staging: greybus: audio: Enable GB
 codec, audio module compilation.
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vaibhav,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 98fe05e21a6e0ca242e974650ed58b64813cb2dc]

url:    https://github.com/0day-ci/linux/commits/Vaibhav-Agarwal/Enable-Greybus-Audio-codec-driver/20200619-192443
base:    98fe05e21a6e0ca242e974650ed58b64813cb2dc
config: nds32-randconfig-r002-20200619 (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=nds32 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/staging/greybus/audio_helper.c:59:5: warning: no previous prototype for 'gbaudio_dapm_link_component_dai_widgets' [-Wmissing-prototypes]
59 | int gbaudio_dapm_link_component_dai_widgets(struct snd_soc_card *card,
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/audio_helper.c:112:5: warning: no previous prototype for 'gbaudio_dapm_free_controls' [-Wmissing-prototypes]
112 | int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/greybus/audio_helper.c:189:5: warning: no previous prototype for 'gbaudio_remove_component_controls' [-Wmissing-prototypes]
189 | int gbaudio_remove_component_controls(struct snd_soc_component *component,
|     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
drivers/staging/greybus/audio_topology.c: In function 'find_gb_module':
>> drivers/staging/greybus/audio_topology.c:31:14: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
31 |  int dev_id, ret;
|              ^~~
drivers/staging/greybus/audio_topology.c: In function 'gbcodec_mixer_dapm_ctl_get':
>> drivers/staging/greybus/audio_topology.c:380:33: warning: variable 'info' set but not used [-Wunused-but-set-variable]
380 |  struct gb_audio_ctl_elem_info *info;
|                                 ^~~~

vim +/gbaudio_dapm_link_component_dai_widgets +59 drivers/staging/greybus/audio_helper.c

1939631ddc545a7 Vaibhav Agarwal 2020-06-19   58  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  @59  int gbaudio_dapm_link_component_dai_widgets(struct snd_soc_card *card,
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   60  					    struct snd_soc_dapm_context *dapm)
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   61  {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   62  	struct snd_soc_dapm_widget *dai_w;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   63  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   64  	/* For each DAI widget... */
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   65  	list_for_each_entry(dai_w, &card->widgets, list) {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   66  		if (dai_w->dapm != dapm)
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   67  			continue;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   68  		switch (dai_w->id) {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   69  		case snd_soc_dapm_dai_in:
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   70  		case snd_soc_dapm_dai_out:
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   71  			break;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   72  		default:
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   73  			continue;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   74  		}
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   75  		gbaudio_dapm_link_dai_widget(dai_w, card);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   76  	}
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   77  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   78  	return 0;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   79  }
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   80  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   81  static void gbaudio_dapm_free_path(struct snd_soc_dapm_path *path)
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   82  {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   83  	list_del(&path->list_node[SND_SOC_DAPM_DIR_IN]);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   84  	list_del(&path->list_node[SND_SOC_DAPM_DIR_OUT]);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   85  	list_del(&path->list_kcontrol);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   86  	list_del(&path->list);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   87  	kfree(path);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   88  }
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   89  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   90  static void gbaudio_dapm_free_widget(struct snd_soc_dapm_widget *w)
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   91  {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   92  	struct snd_soc_dapm_path *p, *next_p;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   93  	enum snd_soc_dapm_direction dir;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   94  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   95  	list_del(&w->list);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   96  	/*
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   97  	 * remove source and sink paths associated to this widget.
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   98  	 * While removing the path, remove reference to it from both
1939631ddc545a7 Vaibhav Agarwal 2020-06-19   99  	 * source and sink widgets so that path is removed only once.
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  100  	 */
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  101  	gbaudio_dapm_for_each_direction(dir) {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  102  		snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p)
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  103  			gbaudio_dapm_free_path(p);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  104  	}
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  105  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  106  	kfree(w->kcontrols);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  107  	kfree_const(w->name);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  108  	kfree_const(w->sname);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  109  	kfree(w);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  110  }
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  111  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19 @112  int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  113  			       const struct snd_soc_dapm_widget *widget,
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  114  			       int num)
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  115  {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  116  	int i;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  117  	struct snd_soc_dapm_widget *w, *next_w;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  118  #ifdef CONFIG_DEBUG_FS
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  119  	struct dentry *parent = dapm->debugfs_dapm;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  120  	struct dentry *debugfs_w = NULL;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  121  #endif
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  122  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  123  	mutex_lock(&dapm->card->dapm_mutex);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  124  	for (i = 0; i < num; i++) {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  125  		/* below logic can be optimized to identify widget pointer */
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  126  		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  127  					 list) {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  128  			if (w->dapm != dapm)
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  129  				continue;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  130  			if (!strcmp(w->name, widget->name))
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  131  				break;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  132  			w = NULL;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  133  		}
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  134  		if (!w) {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  135  			dev_err(dapm->dev, "%s: widget not found\n",
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  136  				widget->name);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  137  			return -EINVAL;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  138  		}
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  139  		widget++;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  140  #ifdef CONFIG_DEBUG_FS
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  141  		if (!parent)
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  142  			debugfs_w = debugfs_lookup(w->name, parent);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  143  		debugfs_remove(debugfs_w);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  144  		debugfs_w = NULL;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  145  #endif
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  146  		gbaudio_dapm_free_widget(w);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  147  	}
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  148  	mutex_unlock(&dapm->card->dapm_mutex);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  149  	return 0;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  150  }
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  151  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  152  static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  153  				   const struct snd_kcontrol_new *controls,
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  154  				   int num_controls, const char *prefix)
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  155  {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  156  	int i, err;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  157  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  158  	for (i = 0; i < num_controls; i++) {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  159  		const struct snd_kcontrol_new *control = &controls[i];
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  160  		struct snd_ctl_elem_id id;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  161  		struct snd_kcontrol *kctl;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  162  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  163  		if (prefix)
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  164  			snprintf(id.name, sizeof(id.name), "%s %s", prefix,
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  165  				 control->name);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  166  		else
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  167  			strlcpy(id.name, control->name, sizeof(id.name));
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  168  		id.numid = 0;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  169  		id.iface = control->iface;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  170  		id.device = control->device;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  171  		id.subdevice = control->subdevice;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  172  		id.index = control->index;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  173  		kctl = snd_ctl_find_id(card, &id);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  174  		if (!kctl) {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  175  			dev_err(dev, "%d: Failed to find %s\n", err,
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  176  				control->name);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  177  			continue;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  178  		}
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  179  		err = snd_ctl_remove(card, kctl);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  180  		if (err < 0) {
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  181  			dev_err(dev, "%d: Failed to remove %s\n", err,
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  182  				control->name);
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  183  			continue;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  184  		}
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  185  	}
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  186  	return 0;
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  187  }
1939631ddc545a7 Vaibhav Agarwal 2020-06-19  188  
1939631ddc545a7 Vaibhav Agarwal 2020-06-19 @189  int gbaudio_remove_component_controls(struct snd_soc_component *component,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--XsQoSWH+UP9D9v3l
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
7Cu7AQA=

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--XsQoSWH+UP9D9v3l--
