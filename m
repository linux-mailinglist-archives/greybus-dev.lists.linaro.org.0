Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C6F6C39CA
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:07:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E6E7441E4
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:07:01 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	by lists.linaro.org (Postfix) with ESMTPS id 638A43F19C
	for <greybus-dev@lists.linaro.org>; Fri, 17 Mar 2023 14:17:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=fLsYWDju;
	spf=pass (lists.linaro.org: domain of questioneight@gmail.com designates 209.85.166.169 as permitted sender) smtp.mailfrom=questioneight@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-il1-f169.google.com with SMTP id h11so2798818ild.11
        for <greybus-dev@lists.linaro.org>; Fri, 17 Mar 2023 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679062679;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLuzKAEkaqcIq6AVNq4PWYMR9r7yckQDIYx3W14fFbQ=;
        b=fLsYWDjuE07eQ6G7uOVyBOIkC4PhM2uiPK5xhuv90Xm/LclY/Ra0qzFnB8lU6UJS7P
         OXqIu97p4TXATvyYYNKHslRWDEScL1KR088FLjH2yVx3qaGpBKQN1rmU8tasyAMQRV8w
         OjpbjB+OctmWGzKRNWuPHTe/GhvMyVhQcDlILgN3ry4q4j6GMkK+2iQy7t9jjAsXhcwK
         /4sQD+m50YS9i/w6B//y5hNhOjObq93mxgT45VM2fGmbs/bCkATU9d2fokGy9zcYJNmX
         C5R62cV6FxRSnItqIPEepLiTCtmjD4slIQZBNXzqdLlPNzqCKPu7ZkCTItQP/g4+x6jx
         W7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679062679;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLuzKAEkaqcIq6AVNq4PWYMR9r7yckQDIYx3W14fFbQ=;
        b=Ty9cUau9GO4N8QmJrx88ghLos/HrU015IwaBTw2a1zkYRBJAJi6djUVr8zu4fpIp+a
         rl4vWyANEZuvZMfG5sVCnZxir80Vvu8PeJplDKHuagUPn3EBEwgRYnl5dmv6Cq0g4XBZ
         ZSTEYXO+f9fJE/QoO3F1+PYu2e9mAZv9TFUH/HDzWELHKFrx0U8vEDVN/DZHV9dVAGeX
         xCLAmxcQGK0I/gRrX5hVPAcwVI5NoRNqezjByI9OlvIKPHeNQsSdoKa/WsQ5OJ49pK23
         WrQI03sH4ATGa1wKV7yjfnX0TrTYmFRnrLFZ+K1XWtMHS5WU9qcObfBmvtOoX0W+zzJV
         Ee4g==
X-Gm-Message-State: AO0yUKUJoi0WA7ZTMu/MLWZ992p0+cc82loLZkpkzIN8I67JovPivPoA
	mNn6vZPT6QiuBHgMiINrpOo=
X-Google-Smtp-Source: AK7set+OyC/Lyv3VlxfdCZWj7X/hYLmc594LVPMonaUxAi00/vpMqSiwJu5BZFZkgYI4SpckqUM1NA==
X-Received: by 2002:a92:ddca:0:b0:323:162a:80d4 with SMTP id d10-20020a92ddca000000b00323162a80d4mr5978ilr.4.1679062678808;
        Fri, 17 Mar 2023 07:17:58 -0700 (PDT)
Received: from pikachu-Z97-D3H ([76.76.64.93])
        by smtp.gmail.com with ESMTPSA id s20-20020a92c5d4000000b00315d1153ffcsm618638ilt.65.2023.03.17.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 07:17:58 -0700 (PDT)
Date: Fri, 17 Mar 2023 08:17:56 -0600
From: Mark Thomas Heim <questioneight@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Message-ID: <20230317141756.GA43753@pikachu-Z97-D3H>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 638A43F19C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.169:from];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: questioneight@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KNROUUEQT5IVQKFEARY57OVAK7DCL46I
X-Message-ID-Hash: KNROUUEQT5IVQKFEARY57OVAK7DCL46I
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:06:55 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: extract a fxn to improve clarity
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KNROUUEQT5IVQKFEARY57OVAK7DCL46I/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The gb_audio_gb_get_topology function at the top of the file
needs to be split per a TODO comment above the function. It
is necessary to refactor the code to pull out a method
that has fewer parameters to improve readability. A
prototype for the new function is now in the relevant header,
and the simpler function calls replace the old ones.

Signed-off-by: Mark Thomas Heim <questioneight@gmail.com>
---
 drivers/staging/greybus/audio_codec.h |  2 ++
 drivers/staging/greybus/audio_gb.c    | 21 +++++++++++----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index ce15e800e607..a2e8361952b8 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -177,6 +177,8 @@ int gbaudio_register_module(struct gbaudio_module_info *module);
 void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
 /* protocol related */
+int fetch_gb_audio_data(struct gb_connection *connection, int type,
+			void *response, int response_size);
 int gb_audio_gb_get_topology(struct gb_connection *connection,
 			     struct gb_audio_topology **topology);
 int gb_audio_gb_get_control(struct gb_connection *connection,
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..3c924d13f0e7 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,7 +8,13 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
+int fetch_gb_audio_data(struct gb_connection *connection,
+			int type, void *response, int response_size)
+{
+	return gb_operation_sync(connection, type, NULL, 0,
+				 response, response_size);
+}
+
 int gb_audio_gb_get_topology(struct gb_connection *connection,
 			     struct gb_audio_topology **topology)
 {
@@ -17,28 +23,23 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 	u16 size;
 	int ret;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
+	ret = fetch_gb_audio_data(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
+				  &size_resp, sizeof(size_resp));
 	if (ret)
 		return ret;
-
 	size = le16_to_cpu(size_resp.size);
 	if (size < sizeof(*topo))
 		return -ENODATA;
-
 	topo = kzalloc(size, GFP_KERNEL);
 	if (!topo)
 		return -ENOMEM;
-
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
+	ret = fetch_gb_audio_data(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
+				  topo, size);
 	if (ret) {
 		kfree(topo);
 		return ret;
 	}
-
 	*topology = topo;
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
