Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rDJmIJEEVGrIgwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 12 Jul 2026 23:18:09 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DA1745EEF
	for <lists+greybus-dev@lfdr.de>; Sun, 12 Jul 2026 23:18:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=kppcipE8;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 54CB440A89
	for <lists+greybus-dev@lfdr.de>; Sun, 12 Jul 2026 21:18:08 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	by lists.linaro.org (Postfix) with ESMTPS id DEF993FDB0
	for <greybus-dev@lists.linaro.org>; Fri, 10 Jul 2026 21:23:27 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so238565766b.0
        for <greybus-dev@lists.linaro.org>; Fri, 10 Jul 2026 14:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718607; x=1784323407; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQKLAy+q4WVq9Y37Ln7ncK+4sykkn+Pf4c/5Lgs8Ca8=;
        b=kppcipE8tmKXMrAMn2JuPCvuLV4ZsUGx/q41hyE77geJw7IRCC+lVXLSHEXUu10JgL
         kXyTZYpPQ53/n2xBAgFTosJD4T1FH3cGX3TsQYRMKcqw/tYW8bLnzqeXOul+hYQ6S4Ag
         F5l0fwWwIn6LkAtBqHeI8pkkUyx6jYL8b1KbM8AGtG/Vd5XdfLyTrYDiBH0GIpLDSZM2
         Dkfo7J9Q1br/F3GsUvF5+xV0IU+UJw9UZwRaVyDZtqfP6w/aAxTkSltPWYP9I6ZK/mrp
         QgnBqhssQCnFsZFL2UgLqOIPzgKqutH1rwcOpaJj4I6qxUksMLeQQ/lt44vbtJysZvad
         lNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718607; x=1784323407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQKLAy+q4WVq9Y37Ln7ncK+4sykkn+Pf4c/5Lgs8Ca8=;
        b=M1S5NyRs1/dHVWQGCaRinX/VEoTsPiSXlhzqgU80A0hXSxs6ExJE3wSydLbazmeLhD
         Qvx4zLbGRArFmWYuklb+Ex9lusZRRfnejCXJ59EEbV59Tj90PbrNW1rJ/Ri/JBphRhML
         Hx3jonnGMz7f9w49JHPsAtyOKB6/bb8/tFbXcJD7EEMg5+lMsvwAUHdVERBlbBK//Lin
         HLY4C8UgID757PkHshRWslvM/onj+Wpxdl8s018iKwIriHrqmUO9VGTk2M8QE2r9WIu6
         S4zzCTgXVx7CiCtbDbt5gE2kTL+4Yb4s57OIHcyUqU0s0kY/oQAdWCR7qHi0p+Y6sXqb
         TaPw==
X-Gm-Message-State: AOJu0YzvpCXyifXn3XShGEHAVKeebuBQnvoWOHqVIQOyujH21Ni+eiEd
	iQj9wvxX17kXYsGVtHF7Kx/LlNBexk0uEtIaqm9OZgvcbxEraR5CGMOeSabLU5yz
X-Gm-Gg: AfdE7clEqSa1f75EafTaqHU2Aka/QDOse0xVNCW2OmxPu7U8b0yEiEwxgbG5bkQ4YiP
	m5jf9UaPaAy1bZ0IQaA4lf6cS4F+7/tXTTP9sVMxSyW3EnDt4BK3snLfGMPjmwkIzkUSxO7wzCn
	2ppXAPW3w82oPp+JgJchYyuP5Awn1AGgvHgHu+Sjo9D9a7vOkC7k73gsGVW6X3+6d2w1dxDDeHt
	5jsXU36/Cy+hWay01gsUbp7MIzPKMtYhUF3YU6cLx4eulw0YLDmNiPwCJvQn9Xa9kQTFB7BjEDJ
	HFh1n4iDAyzrRaWSNKIn4njCxFjqJdbvpcSbbpi4copEIWrAxqrRAxUunezK1uXC5oz/ffaWWNy
	X67ewjeXLq8UQYlAOHWcKz3ChVNh8+rdIWvdlP1vdrigjYN6cK5HVYqwpJpk8t2/a5zMm9s4+eN
	c/pclhCXaC84qXgJpHaO46d2FpCmsabeuS3NtTrIIdd7av6WznmkwNCewl0tfyBLs=
X-Received: by 2002:a17:907:3f0c:b0:c12:34ed:e100 with SMTP id a640c23a62f3a-c161f38b21bmr21774166b.62.1783718606434;
        Fri, 10 Jul 2026 14:23:26 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1602f5e9c5sm137784266b.21.2026.07.10.14.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:23:25 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Date: Sat, 11 Jul 2026 02:23:12 +0500
Message-ID: <20260710212312.117781-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: meatuni001@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7ZVYUXC52DIEMM62R5CQZH3O47GEHLYJ
X-Message-ID-Hash: 7ZVYUXC52DIEMM62R5CQZH3O47GEHLYJ
X-Mailman-Approved-At: Sun, 12 Jul 2026 21:17:59 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Muhammad Bilal <meatuni001@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: bound topology parsing to the received buffer
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7ZVYUXC52DIEMM62R5CQZH3O47GEHLYJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[47];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:meatuni001@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[meatuni001@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[meatuni001@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39DA1745EEF

The Greybus audio topology parser trusts length and count fields taken
straight from the module's topology blob and never checks them against
the size of the buffer it actually allocated, leading to out-of-bounds
reads of the kernel heap.

gb_audio_gb_get_topology() reads a u16 size from the module, allocates a
buffer of that size, fetches the topology into it, and then discards the
size. gbaudio_tplg_parse_data() then walks that buffer using fields
stored inside it:

  - gbaudio_tplg_process_header() computes the control, widget and route
    block offsets by adding the wire-supplied __le32 size_dais,
    size_controls and size_widgets onto the buffer base with no bound, so
    a module that reports a small allocation size but large block sizes
    moves those offsets far past the end of the buffer before they are
    dereferenced.

  - gbaudio_tplg_process_kcontrols(), _process_widgets() and
    _process_routes() iterate num_controls / num_widgets / num_routes
    (also from the blob) and advance a pointer by a per-element size that
    includes the __le16 names_length of an enumerated control, again with
    no check that the element stays inside the buffer.

  - gb_generate_enum_strings() loops over an attacker-controlled __le32
    items count and, for each, scans for a NUL terminator with no end
    pointer, walking off the end of the buffer.

A malicious or malfunctioning module can therefore make the parser read
past the allocation. The wild block offsets are most likely to hit an
unmapped page and oops (denial of service); the byte-at-a-time enum scan
walks from a still-valid pointer and can copy adjacent heap bytes into
ALSA control name strings, which are readable by unprivileged local
users, so an information leak cannot be ruled out.

Thread the allocated topology size from gb_audio_gb_get_topology()
through to gbaudio_tplg_parse_data() and bound every walk against the end
of the buffer: verify the block offsets are ordered and within the
buffer (the "< previous" tests also catch a 32-bit unsigned wrap of the
running offset), check each control, widget and route lies fully inside
its block before use, and give gb_generate_enum_strings() an explicit
end pointer plus an items-versus-names_length sanity check.

Fixes: 6339d2322c47 ("greybus: audio: Add topology parser for GB codec")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/greybus/audio_codec.h    |   4 +-
 drivers/staging/greybus/audio_gb.c       |  13 ++-
 drivers/staging/greybus/audio_module.c   |   6 +-
 drivers/staging/greybus/audio_topology.c | 135 ++++++++++++++++++-----
 4 files changed, 120 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6be40..f9225cf52d843 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -167,7 +167,7 @@ struct gbaudio_module_info {
 };
 
 int gbaudio_tplg_parse_data(struct gbaudio_module_info *module,
-			    struct gb_audio_topology *tplg_data);
+			    struct gb_audio_topology *tplg_data, size_t size);
 void gbaudio_tplg_release(struct gbaudio_module_info *module);
 
 int gbaudio_module_update(struct gbaudio_codec_info *codec,
@@ -179,7 +179,7 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
 /* protocol related */
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology);
+			     struct gb_audio_topology **topology, size_t *size);
 int gb_audio_gb_get_control(struct gb_connection *connection,
 			    u8 control_id, u8 index,
 			    struct gb_audio_ctl_elem_value *value);
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a2..0811652bc417f 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -10,11 +10,11 @@
 
 /* TODO: Split into separate calls */
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+			     struct gb_audio_topology **topology, size_t *size)
 {
 	struct gb_audio_get_topology_size_response size_resp;
 	struct gb_audio_topology *topo;
-	u16 size;
+	u16 tplg_size;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
@@ -22,22 +22,23 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
+	tplg_size = le16_to_cpu(size_resp.size);
+	if (tplg_size < sizeof(*topo))
 		return -ENODATA;
 
-	topo = kzalloc(size, GFP_KERNEL);
+	topo = kzalloc(tplg_size, GFP_KERNEL);
 	if (!topo)
 		return -ENOMEM;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
+				topo, tplg_size);
 	if (ret) {
 		kfree(topo);
 		return ret;
 	}
 
 	*topology = topo;
+	*size = tplg_size;
 
 	return 0;
 }
diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c477b3c..9367ab6debdbe 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -240,6 +240,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	struct gbaudio_data_connection *dai, *_dai;
 	int ret, i;
 	struct gb_audio_topology *topology;
+	size_t tplg_size;
 
 	/* There should be at least one Management and one Data cport */
 	if (bundle->num_cports < 2)
@@ -308,14 +309,15 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	 * FIXME: malloc for topology happens via audio_gb driver
 	 * should be done within codec driver itself
 	 */
-	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology);
+	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology,
+				       &tplg_size);
 	if (ret) {
 		dev_err(dev, "%d:Error while fetching topology\n", ret);
 		goto disable_connection;
 	}
 
 	/* process topology data */
-	ret = gbaudio_tplg_parse_data(gbmodule, topology);
+	ret = gbaudio_tplg_parse_data(gbmodule, topology, tplg_size);
 	if (ret) {
 		dev_err(dev, "%d:Error while parsing topology data\n",
 			ret);
diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddcc..4095e6c741efa 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -134,21 +134,35 @@ static const char **gb_generate_enum_strings(struct gbaudio_module_info *gb,
 					     struct gb_audio_enumerated *gbenum)
 {
 	const char **strings;
-	int i;
 	unsigned int items;
-	__u8 *data;
+	u16 names_length;
+	const __u8 *data;
+	const __u8 *end;
+	int i;
 
 	items = le32_to_cpu(gbenum->items);
+	names_length = le16_to_cpu(gbenum->names_length);
+	data = gbenum->names;
+	end = data + names_length;
+
+	/*
+	 * Each enumerated value is a NUL-terminated string occupying at least
+	 * one byte, so a valid names block cannot hold more items than it has
+	 * bytes. This also bounds the devm_kcalloc() request below.
+	 */
+	if (items > names_length)
+		return NULL;
+
 	strings = devm_kcalloc(gb->dev, items, sizeof(char *), GFP_KERNEL);
 	if (!strings)
 		return NULL;
 
-	data = gbenum->names;
-
 	for (i = 0; i < items; i++) {
 		strings[i] = (const char *)data;
-		while (*data != '\0')
+		while (data < end && *data != '\0')
 			data++;
+		if (data == end)
+			return NULL;
 		data++;
 	}
 
@@ -1009,9 +1023,40 @@ static const struct snd_soc_dapm_widget gbaudio_widgets[] = {
 					SND_SOC_DAPM_POST_PMD),
 };
 
+/*
+ * Return the on-wire size of the topology control at @curr, in bytes, after
+ * verifying that the whole control - including its variable-length enum names
+ * block - lies within [@curr, @end). Returns a negative errno on overrun.
+ */
+static int gbaudio_control_size(struct gb_audio_control *curr, const u8 *end)
+{
+	size_t csize;
+
+	/*
+	 * Enough of the control must be present to read its id and name and
+	 * the fixed part of the enumerated descriptor (items, names_length).
+	 */
+	csize = offsetof(struct gb_audio_control, info);
+	csize += offsetof(struct gb_audio_ctl_elem_info, value);
+	csize += offsetof(struct gb_audio_enumerated, names);
+	if ((u8 *)curr + csize > end)
+		return -EINVAL;
+
+	if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED)
+		csize += le16_to_cpu(curr->info.value.enumerated.names_length);
+	else
+		csize = sizeof(struct gb_audio_control);
+
+	if ((u8 *)curr + csize > end)
+		return -EINVAL;
+
+	return csize;
+}
+
 static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 				      struct snd_soc_dapm_widget *dw,
-				      struct gb_audio_widget *w, int *w_size)
+				      struct gb_audio_widget *w, int *w_size,
+				      const u8 *end)
 {
 	int i, ret, csize;
 	struct snd_kcontrol_new *widget_kctls;
@@ -1040,6 +1085,11 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 	/* create relevant kcontrols */
 	curr = w->ctl;
 	for (i = 0; i < w->ncontrols; i++) {
+		ret = gbaudio_control_size(curr, end);
+		if (ret < 0)
+			goto error;
+		csize = ret;
+
 		ret = gbaudio_tplg_create_wcontrol(module, &widget_kctls[i],
 						   curr);
 		if (ret) {
@@ -1063,10 +1113,6 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 			struct gb_audio_enumerated *gbenum =
 				&curr->info.value.enumerated;
 
-			csize = offsetof(struct gb_audio_control, info);
-			csize += offsetof(struct gb_audio_ctl_elem_info, value);
-			csize += offsetof(struct gb_audio_enumerated, names);
-			csize += le16_to_cpu(gbenum->names_length);
 			control->texts = (const char * const *)
 				gb_generate_enum_strings(module, gbenum);
 			if (!control->texts) {
@@ -1074,8 +1120,6 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 				goto error;
 			}
 			control->items = le32_to_cpu(gbenum->items);
-		} else {
-			csize = sizeof(struct gb_audio_control);
 		}
 
 		*w_size += csize;
@@ -1136,7 +1180,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 }
 
 static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
-					  struct gb_audio_control *controls)
+					  struct gb_audio_control *controls,
+					  const u8 *end)
 {
 	int i, csize, ret;
 	struct snd_kcontrol_new *dapm_kctls;
@@ -1152,6 +1197,11 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 
 	curr = controls;
 	for (i = 0; i < module->num_controls; i++) {
+		ret = gbaudio_control_size(curr, end);
+		if (ret < 0)
+			goto error;
+		csize = ret;
+
 		ret = gbaudio_tplg_create_kcontrol(module, &dapm_kctls[i],
 						   curr);
 		if (ret) {
@@ -1176,10 +1226,6 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 			struct gb_audio_enumerated *gbenum =
 				&curr->info.value.enumerated;
 
-			csize = offsetof(struct gb_audio_control, info);
-			csize += offsetof(struct gb_audio_ctl_elem_info, value);
-			csize += offsetof(struct gb_audio_enumerated, names);
-			csize += le16_to_cpu(gbenum->names_length);
 			control->texts = (const char * const *)
 				gb_generate_enum_strings(module, gbenum);
 			if (!control->texts) {
@@ -1187,8 +1233,6 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 				goto error;
 			}
 			control->items = le32_to_cpu(gbenum->items);
-		} else {
-			csize = sizeof(struct gb_audio_control);
 		}
 
 		list_add(&control->list, &module->ctl_list);
@@ -1210,7 +1254,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 }
 
 static int gbaudio_tplg_process_widgets(struct gbaudio_module_info *module,
-					struct gb_audio_widget *widgets)
+					struct gb_audio_widget *widgets,
+					const u8 *end)
 {
 	int i, ret, w_size;
 	struct snd_soc_dapm_widget *dapm_widgets;
@@ -1225,8 +1270,13 @@ static int gbaudio_tplg_process_widgets(struct gbaudio_module_info *module,
 
 	curr = widgets;
 	for (i = 0; i < module->num_dapm_widgets; i++) {
+		/* The fixed part of the widget must lie within the buffer. */
+		if ((u8 *)curr + sizeof(struct gb_audio_widget) > end) {
+			ret = -EINVAL;
+			goto error;
+		}
 		ret = gbaudio_tplg_create_widget(module, &dapm_widgets[i],
-						 curr, &w_size);
+						 curr, &w_size, end);
 		if (ret) {
 			dev_err(module->dev, "%s:%d type not supported\n",
 				curr->name, curr->type);
@@ -1259,7 +1309,8 @@ static int gbaudio_tplg_process_widgets(struct gbaudio_module_info *module,
 }
 
 static int gbaudio_tplg_process_routes(struct gbaudio_module_info *module,
-				       struct gb_audio_route *routes)
+				       struct gb_audio_route *routes,
+				       const u8 *end)
 {
 	int i, ret;
 	struct snd_soc_dapm_route *dapm_routes;
@@ -1275,6 +1326,10 @@ static int gbaudio_tplg_process_routes(struct gbaudio_module_info *module,
 	curr = routes;
 
 	for (i = 0; i < module->num_dapm_routes; i++) {
+		if ((u8 *)curr + sizeof(struct gb_audio_route) > end) {
+			ret = -EINVAL;
+			goto error;
+		}
 		dapm_routes->sink =
 			gbaudio_map_widgetid(module, curr->destination_id);
 		if (!dapm_routes->sink) {
@@ -1320,8 +1375,12 @@ static int gbaudio_tplg_process_routes(struct gbaudio_module_info *module,
 }
 
 static int gbaudio_tplg_process_header(struct gbaudio_module_info *module,
-				       struct gb_audio_topology *tplg_data)
+				       struct gb_audio_topology *tplg_data,
+				       size_t size)
 {
+	unsigned long tplg_start = (unsigned long)tplg_data;
+	unsigned long tplg_end = tplg_start + size;
+
 	/* fetch no. of kcontrols, widgets & routes */
 	module->num_controls = tplg_data->num_controls;
 	module->num_dapm_widgets = tplg_data->num_widgets;
@@ -1336,6 +1395,20 @@ static int gbaudio_tplg_process_header(struct gbaudio_module_info *module,
 	module->route_offset = module->widget_offset +
 					le32_to_cpu(tplg_data->size_widgets);
 
+	/*
+	 * The DAI, control, widget and route blocks are concatenated in that
+	 * order after the header. Their sizes come straight off the wire and
+	 * are attacker-controlled, so verify the resulting block boundaries
+	 * are ordered and stay within the allocated topology buffer. The
+	 * "< previous" tests also reject an unsigned wrap of the running
+	 * offset on 32-bit builds.
+	 */
+	if (module->control_offset < module->dai_offset ||
+	    module->widget_offset < module->control_offset ||
+	    module->route_offset < module->widget_offset ||
+	    module->route_offset > tplg_end)
+		return -EINVAL;
+
 	dev_dbg(module->dev, "DAI offset is 0x%lx\n", module->dai_offset);
 	dev_dbg(module->dev, "control offset is %lx\n",
 		module->control_offset);
@@ -1346,7 +1419,7 @@ static int gbaudio_tplg_process_header(struct gbaudio_module_info *module,
 }
 
 int gbaudio_tplg_parse_data(struct gbaudio_module_info *module,
-			    struct gb_audio_topology *tplg_data)
+			    struct gb_audio_topology *tplg_data, size_t size)
 {
 	int ret;
 	struct gb_audio_control *controls;
@@ -1357,7 +1430,10 @@ int gbaudio_tplg_parse_data(struct gbaudio_module_info *module,
 	if (!tplg_data)
 		return -EINVAL;
 
-	ret = gbaudio_tplg_process_header(module, tplg_data);
+	if (size < sizeof(*tplg_data))
+		return -EINVAL;
+
+	ret = gbaudio_tplg_process_header(module, tplg_data, size);
 	if (ret) {
 		dev_err(module->dev, "%d: Error in parsing topology header\n",
 			ret);
@@ -1366,7 +1442,8 @@ int gbaudio_tplg_parse_data(struct gbaudio_module_info *module,
 
 	/* process control */
 	controls = (struct gb_audio_control *)module->control_offset;
-	ret = gbaudio_tplg_process_kcontrols(module, controls);
+	ret = gbaudio_tplg_process_kcontrols(module, controls,
+					     (const u8 *)module->widget_offset);
 	if (ret) {
 		dev_err(module->dev,
 			"%d: Error in parsing controls data\n", ret);
@@ -1376,7 +1453,8 @@ int gbaudio_tplg_parse_data(struct gbaudio_module_info *module,
 
 	/* process widgets */
 	widgets = (struct gb_audio_widget *)module->widget_offset;
-	ret = gbaudio_tplg_process_widgets(module, widgets);
+	ret = gbaudio_tplg_process_widgets(module, widgets,
+					   (const u8 *)module->route_offset);
 	if (ret) {
 		dev_err(module->dev,
 			"%d: Error in parsing widgets data\n", ret);
@@ -1386,7 +1464,8 @@ int gbaudio_tplg_parse_data(struct gbaudio_module_info *module,
 
 	/* process route */
 	routes = (struct gb_audio_route *)module->route_offset;
-	ret = gbaudio_tplg_process_routes(module, routes);
+	ret = gbaudio_tplg_process_routes(module, routes,
+					  (const u8 *)tplg_data + size);
 	if (ret) {
 		dev_err(module->dev,
 			"%d: Error in parsing routes data\n", ret);
-- 
2.55.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
