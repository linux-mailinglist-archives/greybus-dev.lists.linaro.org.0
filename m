Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2C7687AC
	for <lists+greybus-dev@lfdr.de>; Sun, 30 Jul 2023 21:50:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11F263E94C
	for <lists+greybus-dev@lfdr.de>; Sun, 30 Jul 2023 19:50:11 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	by lists.linaro.org (Postfix) with ESMTPS id 3CE713F667
	for <greybus-dev@lists.linaro.org>; Sun, 30 Jul 2023 19:50:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=M8+6ajDB;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.170 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-563e860df0fso2856943a12.2
        for <greybus-dev@lists.linaro.org>; Sun, 30 Jul 2023 12:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690746604; x=1691351404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u27NIksPk0ZHmWDjwsNRDuCzPFzRsu4wgW4c9Nm6V14=;
        b=M8+6ajDB4ayWLoZryg7vdsNH0AedeDP/kOrq5ejNE/HlLny+hUvf7OGaIzRIKq6gxj
         Uv7+KbM0AQsgfVmbhUEW/9zi9+pOmYEJvSzDCICDEM8VJjZCj3gnRVF3xI0Nj4LJ/RAq
         jSWIK5vBDgbw5W8qxmtKeCcwxqredZLf2hVXFd45hW5j8QR7WY1+v/+24MKXtumcnRsm
         OnegniQAimgzdDkRh07/YmwqWfHouGeTv3REk5zbzrRgKdDGlIE+KdVuvVv8BpBLVhY3
         zE78OGxfb4JwiovsraV4OWr7zTX1y3A+RYaz6gTGQjNK+PleBr469GF0UvKdgaw4Clv9
         V8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690746604; x=1691351404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u27NIksPk0ZHmWDjwsNRDuCzPFzRsu4wgW4c9Nm6V14=;
        b=cNHV1+VVuixvviOHUJKsfy0NVeIZ1xGeP8LrqD/EWn5gLC1FDCW9qxgSAXA2rZJhu9
         ITfz4t6uhKYTc4LFDgx7xEStZDAMNYXgpfJfSpsATJh1nwbRDmukKr/AtZbB1X3cyF0H
         TtLfHYVsUNNoW/W69YxlN2gQqGr+iyeiPLIPZQ4/Qeu20HEjEUPoqh8MqKdF3dxTirMM
         2CvRXnpHUX7cp+9Uz8H31osx3FLFmL3pQjS9uEZrjN7dPM4766j/PFnhCJNYYAgZcLsk
         fJ4oJc3/9RLdJU4p2PvuYwjYGSR/5xKed5YCbDuHC3XMz8gaQGJWlwQEuqnGg6du+dNY
         uZKw==
X-Gm-Message-State: ABy/qLYpysn5XWxx9Gn8XTJ5NAJYLNLhEsrd7hoHDgcMoW0ZVqNi+tjZ
	HicTtQ5I4oxRPKT5ZR4ngSfrE25Yp4M7bBjd
X-Google-Smtp-Source: APBJJlFyAi5vlQ06YZ7XDYu9nhJepkeVahH6KRnLwAbDvYWaSU9rmlF4UgY4rw14VO7VYHRwqIb/Vw==
X-Received: by 2002:a17:90b:4d92:b0:268:14d7:bc34 with SMTP id oj18-20020a17090b4d9200b0026814d7bc34mr7546247pjb.20.1690746603838;
        Sun, 30 Jul 2023 12:50:03 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.66])
        by smtp.gmail.com with ESMTPSA id gf4-20020a17090ac7c400b00263dccf96a3sm5061200pjb.54.2023.07.30.12.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 12:50:03 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Mon, 31 Jul 2023 01:17:51 +0530
Message-ID: <20230730194752.32042-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <2023073032-hasty-crease-683a@gregkh>
References: <2023073032-hasty-crease-683a@gregkh>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3CE713F667
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.215.170:from,103.15.228.66:received];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.170:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: E3BA3KRDCK2I3FDJDP43IIJ4ZVUWLFCP
X-Message-ID-Hash: E3BA3KRDCK2I3FDJDP43IIJ4ZVUWLFCP
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, johan@kernel.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/1] First Patch Reroll
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E3BA3KRDCK2I3FDJDP43IIJ4ZVUWLFCP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

So my first patch description seemed to be immproper. So now using
subject and description from a successful patch

Ayush Singh (1):
  greybus: es2: Remove extra newline

 drivers/greybus/es2.c | 1 -
 1 file changed, 1 deletion(-)

-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
