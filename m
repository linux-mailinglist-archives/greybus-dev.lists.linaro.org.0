Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9342646F44D
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Dec 2021 20:52:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4A4E761EB5
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Dec 2021 19:52:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9006061A48; Thu,  9 Dec 2021 19:52:55 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AFD4F61A3F;
	Thu,  9 Dec 2021 19:52:52 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2A58B61A36
 for <greybus-dev@lists.linaro.org>; Thu,  9 Dec 2021 19:52:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 15A7761A3D; Thu,  9 Dec 2021 19:52:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.linaro.org (Postfix) with ESMTPS id CD97761A36
 for <greybus-dev@lists.linaro.org>; Thu,  9 Dec 2021 19:52:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 137FBB82619;
 Thu,  9 Dec 2021 19:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65511C004DD;
 Thu,  9 Dec 2021 19:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639079566;
 bh=teoF46qjaD0R6MVCCZefMM9Xa6ea84rcddEa/DwjD/8=;
 h=From:To:Cc:Subject:Date:From;
 b=O0vCRKfsaeWmxvf5sG/KzPYTqr7p45gvaWWDqh5a+2N1ifo9ns+iel4UBDdqjRLBP
 AaSW2hVLPnV97KTxj39jmA6JmC3McQDdGwQc5Kdpy1+zKSdukBdaAvbfvalRAPxp11
 HVfYcRHTXOvO1yCzldSbCZ9CWrGj4cQaue3XftV16AQHmea3IzzyacxeHj+aN/2NGC
 4sThzBPH/OepjyMHm+CRrT7HrHgO/2ah9OJen5Fn2to3NkC9n5/ogaKho9h9U6HSYh
 DNDX2jlLfhq8bRcyPRPVstGtHhVejXv8khXfWgZvmnFEcoZ4GPUqU99YsptsMNPvOX
 u2mKzNEWPcGHw==
From: Nathan Chancellor <nathan@kernel.org>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Date: Thu,  9 Dec 2021 12:51:42 -0700
Message-Id: <20211209195141.1165233-1-nathan@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] [PATCH v2] staging: greybus: fix stack size warning
 with UBSAN
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: llvm@lists.linux.dev, linux-staging@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

From: Arnd Bergmann <arnd@arndb.de>

clang warns about excessive stack usage in this driver when
UBSAN is enabled:

drivers/staging/greybus/audio_topology.c:977:12: error: stack frame size of 1836 bytes in function 'gbaudio_tplg_create_widget' [-Werror,-Wframe-larger-than=]

Rework this code to no longer use compound literals for
initializing the structure in each case, but instead keep
the common bits in a preallocated constant array and copy
them as needed.

Link: https://github.com/ClangBuiltLinux/linux/issues/1535
Link: https://lore.kernel.org/r/20210103223541.2790855-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
[nathan: Address review comments from v1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

v1 -> v2: https://lore.kernel.org/r/20210103223541.2790855-1-arnd@kernel.org/

* Use NULL for name field in SND_DOC_DAPM_* in gbaudio_widgets (Alex).

* Do not eliminate *dw assignment within the switch cases, as invalid
  enum values in-between valid enum values (such as snd_soc_dapm_demux)
  would not be handled properly by the "if value is greater than the
  array size" check (Alex). This addresses a few other comments by Alex
  and Dan because w->type is not checked against the array's size.

Arnd, if you disagree with this approach, please let me know so that we
can get this fixed in a way that everyone is happy with.

 drivers/staging/greybus/audio_topology.c | 92 ++++++++++++------------
 1 file changed, 45 insertions(+), 47 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 1e613d42d823..7f7d558b76d0 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -974,6 +974,44 @@ static int gbaudio_widget_event(struct snd_soc_dapm_widget *w,
 	return ret;
 }
 
+static const struct snd_soc_dapm_widget gbaudio_widgets[] = {
+	[snd_soc_dapm_spk]	= SND_SOC_DAPM_SPK(NULL, gbcodec_event_spk),
+	[snd_soc_dapm_hp]	= SND_SOC_DAPM_HP(NULL, gbcodec_event_hp),
+	[snd_soc_dapm_mic]	= SND_SOC_DAPM_MIC(NULL, gbcodec_event_int_mic),
+	[snd_soc_dapm_output]	= SND_SOC_DAPM_OUTPUT(NULL),
+	[snd_soc_dapm_input]	= SND_SOC_DAPM_INPUT(NULL),
+	[snd_soc_dapm_switch]	= SND_SOC_DAPM_SWITCH_E(NULL, SND_SOC_NOPM,
+					0, 0, NULL,
+					gbaudio_widget_event,
+					SND_SOC_DAPM_PRE_PMU |
+					SND_SOC_DAPM_POST_PMD),
+	[snd_soc_dapm_pga]	= SND_SOC_DAPM_PGA_E(NULL, SND_SOC_NOPM,
+					0, 0, NULL, 0,
+					gbaudio_widget_event,
+					SND_SOC_DAPM_PRE_PMU |
+					SND_SOC_DAPM_POST_PMD),
+	[snd_soc_dapm_mixer]	= SND_SOC_DAPM_MIXER_E(NULL, SND_SOC_NOPM,
+					0, 0, NULL, 0,
+					gbaudio_widget_event,
+					SND_SOC_DAPM_PRE_PMU |
+					SND_SOC_DAPM_POST_PMD),
+	[snd_soc_dapm_mux]	= SND_SOC_DAPM_MUX_E(NULL, SND_SOC_NOPM,
+					0, 0, NULL,
+					gbaudio_widget_event,
+					SND_SOC_DAPM_PRE_PMU |
+					SND_SOC_DAPM_POST_PMD),
+	[snd_soc_dapm_aif_in]	= SND_SOC_DAPM_AIF_IN_E(NULL, NULL, 0,
+					SND_SOC_NOPM, 0, 0,
+					gbaudio_widget_event,
+					SND_SOC_DAPM_PRE_PMU |
+					SND_SOC_DAPM_POST_PMD),
+	[snd_soc_dapm_aif_out]	= SND_SOC_DAPM_AIF_OUT_E(NULL, NULL, 0,
+					SND_SOC_NOPM, 0, 0,
+					gbaudio_widget_event,
+					SND_SOC_DAPM_PRE_PMU |
+					SND_SOC_DAPM_POST_PMD),
+};
+
 static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 				      struct snd_soc_dapm_widget *dw,
 				      struct gb_audio_widget *w, int *w_size)
@@ -1052,77 +1090,37 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
-		*dw = (struct snd_soc_dapm_widget)
-			SND_SOC_DAPM_SPK(w->name, gbcodec_event_spk);
+		*dw = gbaudio_widgets[w->type];
 		module->op_devices |= GBAUDIO_DEVICE_OUT_SPEAKER;
 		break;
 	case snd_soc_dapm_hp:
-		*dw = (struct snd_soc_dapm_widget)
-			SND_SOC_DAPM_HP(w->name, gbcodec_event_hp);
+		*dw = gbaudio_widgets[w->type];
 		module->op_devices |= (GBAUDIO_DEVICE_OUT_WIRED_HEADSET
 					| GBAUDIO_DEVICE_OUT_WIRED_HEADPHONE);
 		module->ip_devices |= GBAUDIO_DEVICE_IN_WIRED_HEADSET;
 		break;
 	case snd_soc_dapm_mic:
-		*dw = (struct snd_soc_dapm_widget)
-			SND_SOC_DAPM_MIC(w->name, gbcodec_event_int_mic);
+		*dw = gbaudio_widgets[w->type];
 		module->ip_devices |= GBAUDIO_DEVICE_IN_BUILTIN_MIC;
 		break;
 	case snd_soc_dapm_output:
-		*dw = (struct snd_soc_dapm_widget)SND_SOC_DAPM_OUTPUT(w->name);
-		break;
 	case snd_soc_dapm_input:
-		*dw = (struct snd_soc_dapm_widget)SND_SOC_DAPM_INPUT(w->name);
-		break;
 	case snd_soc_dapm_switch:
-		*dw = (struct snd_soc_dapm_widget)
-			SND_SOC_DAPM_SWITCH_E(w->name, SND_SOC_NOPM, 0, 0,
-					      widget_kctls,
-					      gbaudio_widget_event,
-					      SND_SOC_DAPM_PRE_PMU |
-					      SND_SOC_DAPM_POST_PMD);
-		break;
 	case snd_soc_dapm_pga:
-		*dw = (struct snd_soc_dapm_widget)
-			SND_SOC_DAPM_PGA_E(w->name, SND_SOC_NOPM, 0, 0, NULL, 0,
-					   gbaudio_widget_event,
-					   SND_SOC_DAPM_PRE_PMU |
-					   SND_SOC_DAPM_POST_PMD);
-		break;
 	case snd_soc_dapm_mixer:
-		*dw = (struct snd_soc_dapm_widget)
-			SND_SOC_DAPM_MIXER_E(w->name, SND_SOC_NOPM, 0, 0, NULL,
-					     0, gbaudio_widget_event,
-					     SND_SOC_DAPM_PRE_PMU |
-					     SND_SOC_DAPM_POST_PMD);
-		break;
 	case snd_soc_dapm_mux:
-		*dw = (struct snd_soc_dapm_widget)
-			SND_SOC_DAPM_MUX_E(w->name, SND_SOC_NOPM, 0, 0,
-					   widget_kctls, gbaudio_widget_event,
-					   SND_SOC_DAPM_PRE_PMU |
-					   SND_SOC_DAPM_POST_PMD);
+		*dw = gbaudio_widgets[w->type];
 		break;
 	case snd_soc_dapm_aif_in:
-		*dw = (struct snd_soc_dapm_widget)
-			SND_SOC_DAPM_AIF_IN_E(w->name, w->sname, 0,
-					      SND_SOC_NOPM,
-					      0, 0, gbaudio_widget_event,
-					      SND_SOC_DAPM_PRE_PMU |
-					      SND_SOC_DAPM_POST_PMD);
-		break;
 	case snd_soc_dapm_aif_out:
-		*dw = (struct snd_soc_dapm_widget)
-			SND_SOC_DAPM_AIF_OUT_E(w->name, w->sname, 0,
-					       SND_SOC_NOPM,
-					       0, 0, gbaudio_widget_event,
-					       SND_SOC_DAPM_PRE_PMU |
-					       SND_SOC_DAPM_POST_PMD);
+		*dw = gbaudio_widgets[w->type];
+		dw->sname = w->sname;
 		break;
 	default:
 		ret = -EINVAL;
 		goto error;
 	}
+	dw->name = w->name;
 
 	dev_dbg(module->dev, "%s: widget of type %d created\n", dw->name,
 		dw->id);

base-commit: 42eb8fdac2fc5d62392dcfcf0253753e821a97b0
-- 
2.34.1

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
