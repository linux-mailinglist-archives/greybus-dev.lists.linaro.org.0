Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPY5EPSLoGkCkwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 19:07:48 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEC11AD42A
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 19:07:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9904F3F9B5
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 18:07:46 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	by lists.linaro.org (Postfix) with ESMTPS id 611B73F8EE
	for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 17:58:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Dp88VOip;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.214.170 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ada721eda1so5179525ad.2
        for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 09:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772128711; x=1772733511; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJLRMsLLh6RoXlQaUqAZ1rl6qsmJSmxpR2KNMW8P0t4=;
        b=Dp88VOipmjg1jPDdn2LQAUiLuxzTQEuBAtwAXTSwAnhh0zNUAnAYDq2ZSAacaO0u0Q
         VPZL+rSGpFKSSS1K7jKn2z+nQ+EMeUpqc+k6PrRripiMI8ZPM4hm8KbtBcl5Idz9m3RZ
         4aDT8IgQkKCg2M9230j5VlS0jlqYG1GJTyWOmv4VrXIYmUHwOzE9N0QU8EkncXyvfuYh
         8At44StxrK+cWVodBqFjZAfDwisvECCOq4Mw2fs/0Qk02oxEVpfHkTe/5ds0Bs4sA6ZA
         g2O8I/18iFZbBHQQjGoHe5SxCbpiQDLJJLIqscE3mXtXlYX8RvtUjMerHcV8gMpolblH
         5hXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772128711; x=1772733511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJLRMsLLh6RoXlQaUqAZ1rl6qsmJSmxpR2KNMW8P0t4=;
        b=kFgSx83DH8vxHHHDxLS6SQi8mRUHQu1QJB7MCLUMQAd8OQMhAjVWAhKByNq70A/l0X
         POhaDZXbJ+Ds9a8Fp03Q14x6gF3URAQyQXYQIsG8bYXY3IDBSZPJ56vcF/SIhnlsPu9d
         aYfhpA+WuEs+mBIDonTSZQbPK220Vz/vvIcyKqc1nd+RPstVyEslRp6KVUqWbV2GeBVA
         ATJPGDISZrokqhHM2XtHsXOVNi33jaBjgACQyduh/zZb8JtQTyRqOD2t5tDG819wgGH7
         0gm+avJ6bIV7yusdiQzDNPhzDTSLowUCfVhuF+DkjJbbLVxQmnVNfOVE+49OxpxIKLnF
         UsRA==
X-Forwarded-Encrypted: i=1; AJvYcCWyKq1Tvca+OgtJrK9dxvO1N619QEN7QHFotjuLDfudRYi2LAJiQc/HtOmbsEY/sDHFs3CwUf1dBl2wdg==@lists.linaro.org
X-Gm-Message-State: AOJu0YxR1sCVUUrlvYQ59WZ0e0UDZULBPnrU378xssVvzprr6iTGS6az
	29c19WGdza0o6qFitN+XSfPsxePEhKZVcxXVG8t+CoVtQeEBuqBY5D/o
X-Gm-Gg: ATEYQzw6plDzGiEpoaWvz3siwp9IkSV/ql7qRy6U7eIzNygvgI8dOA+Hf6vuSPk038s
	YhA8vIOkOy2VJi8WikAf+urCF33047MJpCgEEPDf3oyUFSgC34aIgBYtZtHnJlQlGi2Su7COx6P
	ymYgnusQ4GZZtLTshaLMEWYjDDZ51jscXULWbOjaEc+ovj4EsZ+LPn5Ebn14W51Aep9kqPV7Zi2
	6P09fPfN8U+Vjq1Ln0AlWCiY7CFs47fHL8tbi36PSUXBJPagN4dicPPZxfxi/oxtgxUN4k0/Dns
	DblhFfEddfUYC94gqwIp2kP23R4u6FbXV5y+VTWtNPI+K7Yqsn7f8ebM/AZ/GTma5WMRHMuU+d8
	CuMxNu/gS+TzrFkqpcvBRc7bTYONeGQU/QCaoHfYqviWXDB4qu+Fkl/3AgrFoX7hbep7LtFqEwU
	hSQn7UmozvfwVKbjTtUkqej6Gjbzd0a55hffWQwQvaJGBf
X-Received: by 2002:a17:902:d2c2:b0:2a9:47ff:1020 with SMTP id d9443c01a7336-2ade9972102mr37058085ad.8.1772128711372;
        Thu, 26 Feb 2026 09:58:31 -0800 (PST)
Received: from fedora ([2409:40e5:1160:7851:d9ac:d756:7e02:e043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb757a8dsm45547195ad.40.2026.02.26.09.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:58:30 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: dan.carpenter@linaro.org
Date: Thu, 26 Feb 2026 23:28:11 +0530
Message-ID: <20260226175811.17881-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aZ_9V7cldGzWNDrb@stanley.mountain>
References: <aZ_9V7cldGzWNDrb@stanley.mountain>
MIME-Version: 1.0
X-Spamd-Bar: -
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XLVETDC5ZTWO4CZ63HJZCHQ32SBHHYY6
X-Message-ID-Hash: XLVETDC5ZTWO4CZ63HJZCHQ32SBHHYY6
X-Mailman-Approved-At: Thu, 26 Feb 2026 18:07:44 +0000
CC: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: uart: fix style issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XLVETDC5ZTWO4CZ63HJZCHQ32SBHHYY6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: CBEC11AD42A
X-Rspamd-Action: no action

Hi Dan,
Thanks for the review.
You're right, the comments are too vague and don't add much value.
I'll review what the locks actually protect and resend with more
specific documentation, or drop the patch if it doesn't improve clarity.

Thanks,
Shubham
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
