Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0E55403F2
	for <lists+greybus-dev@lfdr.de>; Tue,  7 Jun 2022 18:40:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C93CC3F1A7
	for <lists+greybus-dev@lfdr.de>; Tue,  7 Jun 2022 16:40:55 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	by lists.linaro.org (Postfix) with ESMTPS id BAD523F0D1
	for <greybus-dev@lists.linaro.org>; Tue,  7 Jun 2022 16:40:53 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 184so413694pga.12
        for <greybus-dev@lists.linaro.org>; Tue, 07 Jun 2022 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W8rwN3Jx6kG6W0OrIJ1jYETqFXWQxvnr8RKgWWTrkqM=;
        b=XMHL4/Jkz5kuNpGJNXQ/Bo9VoJybfxuND8WBmMI71IqhCvC7buvP65oeqaka6UadH9
         5UqxLIR28QxB/gb5tpJ2llJeXyrNvOeT44QmE31thANjqX/QoVR5cnjd3xsId4TERasE
         iPXSvqb8WxlFGHgLqVvERupW83X2FEpTTGyuH2ZxPA7MO1uTRmmn1Bqj36ufVYuoRPn5
         ZLvNIwuEBcm9X+rOovVNraALF/yN03+I7A/VkjMnHvD1Aj2t4Kg//FZGzQZKB2Nss2Oc
         bV74X/eDXR2ZbuvmkpfHaZC90iU2l6teCb1Js+KcbJQOAjeyHu0xq6HUZXFXmQoktJcU
         lBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W8rwN3Jx6kG6W0OrIJ1jYETqFXWQxvnr8RKgWWTrkqM=;
        b=Iz+2RYGUY4FgIp9rvyIcc8bMjgq+xKXAgRIASenSjqtMepiKTuRYcdCO15gTPiJYpf
         3z830sZzSQ5mKfmvQEO5Ylj3FNOayLjY9tmcqeE1jOIKj5AzAYNYJQHE2+VSXGEkIIUc
         snAIGHU+KvBVk6rIE68TxzxvMUw0xignSuADym+pF7IKQN2S9tzZNKaj6O8NKoL3JbFv
         kwLIEqnu9GQTxm7uQjTfKQHF7GM/2KzPZssWgyDcKk4jAkPDt2hnD6VdZw20zkCT982U
         eUEXvxDUEr/cSVPvhGDagUo7J6Q/gZ+XyplXWyB8c7Q8paFJirpAnhL2Xa1s4/aSkIF7
         mLBw==
X-Gm-Message-State: AOAM5337pOfkYb9jW7pCDcjzUcg6wL4G6NGheHZ+cv3/vp+9UijX2WdX
	hOls4qneEPVKyCDUVXshabo=
X-Google-Smtp-Source: ABdhPJyccfA+r17Q/AS9I4VBKNAtHMpjPjAethjyWPjji/o+/dd2tRPjIEWVlBmmMSWdhKxzby/1cQ==
X-Received: by 2002:a63:84c3:0:b0:3fc:87ff:cdfa with SMTP id k186-20020a6384c3000000b003fc87ffcdfamr25671860pgd.460.1654620052837;
        Tue, 07 Jun 2022 09:40:52 -0700 (PDT)
Received: from fedora ([2601:1c1:4202:28a0::ec2b])
        by smtp.gmail.com with ESMTPSA id y9-20020a1709027c8900b0016782c55790sm3877042pll.232.2022.06.07.09.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 09:40:52 -0700 (PDT)
Date: Tue, 7 Jun 2022 09:40:50 -0700
From: Jared Kangas <kangas.jd@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <Yp9/kqBUzpArfPdn@fedora>
References: <20220605231806.720085-1-kangas.jd@gmail.com>
 <20220606130626.GX2146@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606130626.GX2146@kadam>
Message-ID-Hash: NAUP4J3A6KSC6YDS7LDQ4X7Y6SGZQBMM
X-Message-ID-Hash: NAUP4J3A6KSC6YDS7LDQ4X7Y6SGZQBMM
X-MailFrom: kangas.jd@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: fix loop cursor use after iteration
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NAUP4J3A6KSC6YDS7LDQ4X7Y6SGZQBMM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks for catching that! Is there anything I need to do to add the
'Fixes:' tag to the patch? From my understanding, adding tags is done by
a maintainer later on, but I'm new to the patch submission process so I
want to make sure I'm not missing anything.

Jared
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
